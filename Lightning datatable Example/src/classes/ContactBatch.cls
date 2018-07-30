global class ContactBatch implements Database.Batchable<sObject>, Database.stateful {

List<Contact> conIds = new List<Contact>();
List<String> Emails = new List<String>();


global Database.QueryLocator start(Database.BatchableContext BC) {
String query = 'SELECT Id,Name,email,accountId,HasOptedOutOfEmail FROM Contact where HasOptedOutOfEmail=false and email=null and LastModifiedDate = TODAY';
return Database.getQueryLocator(query);
}

global void execute(Database.BatchableContext BC, List<Contact> scope) {

List<Contact> conIds1;

for(contact c : scope)
{
conIds1 = new List<Contact>();
conIds1.add(c);
}

conIds = conIds1;

}

global void finish(Database.BatchableContext BC) {

system.debug('conIds...'+conIds);

List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
Map<Id, Account> accts = new Map<id, Account>([
        SELECT ownerId,name FROM Account
        WHERE Id IN (SELECT AccountId FROM Contact WHERE Id IN :conIds) ]);

       
        Map<Id, User> users= new Map<id, user>([
        select id,name from user]);
        
        
        EmailTemplate etObj = [select id,body,subject from EmailTemplate where name = :System.label.Send_email];
        for(contact con : conIds)
        {
        Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();


Account acc = accts.get(con.AccountId);
user u= users.get(acc.ownerId);
                        String plainTextBody =   etObj.body;
                        plainTextBody = plainTextBody.replace('conName',con.name).replace('accName',con.accountId).replace('conId',con.Id);
                        email.setTargetObjectId(u.id);
                        email.setSubject(etObj.subject);
                        email.setPlainTextBody(plainTextBody);
                        email.setSaveAsActivity(false);                   
                        emailList.add(email);
        
        
        }
           
List<Messaging.SendEmailResult> sr = Messaging.sendEmail(emailList,false);
                System.Debug(LoggingLevel.INFO, 'TOTAL EMAIL result '+sr);

//Below code will fetch the job Id
AsyncApexJob a = [Select a.TotalJobItems, a.Status, a.NumberOfErrors, a.JobType, a.JobItemsProcessed, a.ExtendedStatus, a.CreatedById, a.CompletedDate From AsyncApexJob a WHERE id = :BC.getJobId()];//get the job Id

if(a.Status == 'Completed')
{

List<CronTrigger> scheduledJobs = [Select id from cronTrigger where CronJobDetail.name = 'Scheduler'];

if(scheduledJobs.isEmpty())
{
Decimal minutes=1440;
Decimal chunkSize=200;
Boolean isChaining=true;

if(isChaining)
System.scheduleBatch(new contactBatch(),'Scheduler',minutes.intValue(),chunkSize.intValue());
}
}



        
}
}
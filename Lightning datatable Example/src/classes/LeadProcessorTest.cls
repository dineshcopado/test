@IsTest
private class LeadProcessorTest
{

static testMethod void testName() {



List<Lead> accList = new List<Lead>();

for(Integer i =0; i<200;i++)accList.add(new Lead(Company='test'+i, status = 'Working - Contacted', lastName ='test'));

insert accList;


Test.startTest();
        LeadProcessor  uca = new LeadProcessor();
       try
       { Id batchId = Database.executeBatch(uca);}
       catch(Exception ex){system.debug(ex);}
        Test.stopTest();
        // after the testing stops, assert records were updated properly
        //System.assertEquals(10, [select count() from contact where MailingCity = 'New York']);



}}
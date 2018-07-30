trigger BoolCheck on Contact (after insert, after update) {

Set<ID> acctIds = new Set<ID>();


for(contact con : trigger.new)
{
if(con.accountId!=null)
acctIds.add(con.accountId);
}

 Map<ID, Contact> contactsForAccounts = new Map<ID, Contact>([select Id
                                                            ,AccountId
                                                            from Contact
                                                            where AccountId in :acctIds]);
                                                            
 Map<ID, Contact> contactsForAccountswithCheckbox = new Map<ID, Contact>([select Id
                                                            ,AccountId
                                                            from Contact 
                                                            where AccountId in :acctIds and Flag__c=true]);

    Map<ID, Account> acctsToUpdate = new Map<ID, Account>([select Id
                                                                 ,Number_of_Contacts__c
                                                                  from Account
                                                                  where Id in :acctIds]);
                                                                  
   for (Account acct : acctsToUpdate.values()) {
   
   system.debug('acct ...'+acct );
        Set<ID> conIds = new Set<ID>();
         Set<ID> conIds1 = new Set<ID>();
        for (Contact con : contactsForAccounts.values()) {
            if (con.AccountId == acct.Id)
                conIds.add(con.Id);
        }
        for (Contact con : contactsForAccountswithCheckbox.values()) {
            if (con.AccountId == acct.Id)
                conIds1.add(con.Id);
        }
        
           system.debug('conIds1...'+conIds +' '+conIds1);

     if(conIds.size()==conIds1.size()) 
     {
     
     acct.conFlag__c =true;
     update acct;
     
     }
    }                                                               


}
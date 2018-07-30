public class AccountProcessor
{

@future
public static void countContacts(Set<Id> accList)
{

for(String acc : accList)

{    


Account accs = [SELECT Id,Name,(SELECT Id FROM Contacts) FROM Account WHERE Id = :acc];

accs.Number_of_Contacts__c = accs.Contacts.size();

if(accs.Number_of_Contacts__c!=null)
update accs;

}}

}
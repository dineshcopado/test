@IsTest
private class AccountProcessorTest
{

static testMethod void testName() {

List<String> accListId = new List<String>();

List<account> accList = new List<account>();

for(Integer i =0; i<5;i++)accList.add(new account(name ='test'+i));

insert accList;

system.debug('accList....'+accList);

Map<Id, account> accounts = new Map<Id, account>();
accounts.putAll(accList);


    Test.startTest();
AccountProcessor.countContacts(accounts.keySet());
    Test.stopTest();



}

}
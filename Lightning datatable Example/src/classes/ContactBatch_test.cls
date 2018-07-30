@isTest
private class ContactBatch_test
{

static testMethod void testMethod1()
{
TestDataFactory.createAccounts(1);
TestDataFactory.createContact(1);
//TestDataFactory.createET(1);


Test.startTest();

DataBase.executeBatch(new ContactBatch());

Test.stopTest();
}
}
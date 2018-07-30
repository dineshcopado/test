@IsTest
private class TestRestrictContactByName{

@isTest static void methTestRestrictContactByName()
{
Test.startTest();
try{
 Contact c = new Contact(LastName = 'INVALIDNAME');
 insert c;

if(c.LastName == 'INVALIDNAME') {   //invalidname is invalid
         
         
            c.AddError('The Last Name "'+c.LastName+'" is not allowed for DML');
        }}
        catch(Exception ex)
        {
        Boolean expectedExceptionThrown =  ex.getMessage().contains('FIELD_CUSTOM_VALIDATION_EXCEPTION') ? true : false;
System.assertEquals(expectedExceptionThrown, true);

}


    Test.stopTest();
    
}

}
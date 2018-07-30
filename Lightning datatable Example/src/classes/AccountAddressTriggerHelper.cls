public with sharing class AccountAddressTriggerHelper

{

public static void updateAccountAddress(List<Account> accList)
{

for(account acc : accList)
{

if(acc.BillingPostalCode !=null && acc.Match_Billing_Address__c)
{

acc.ShippingPostalCode = acc.BillingPostalCode ;

}



}

} }
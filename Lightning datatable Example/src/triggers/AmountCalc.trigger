trigger AmountCalc on Contact (after insert, after update, after delete, after undelete) {

List<Account> list_acc;


//List<contact> lst_cont = Trigger.Isinsert || Trigger.isdelete ? Trigger.New : Trigger.old;


//Map<Id,Account> m1 = new Map<Id,Account>([select id,Amount_B__c,Amount_A__c from account where Id in (select accountId from contact where Id IN : Trigger.new )]);


If(Trigger.isAfter)
{

list_acc = new List<account>();

if(Trigger.isInsert || Trigger.IsUpdate  || Trigger.IsUndelete)
{

system.debug('undelete new....'+trigger.old);


for(contact con : Trigger.new)
{

if(con.Amount_Type__c == 'Type A' && con.accountId!=null)
{


 List<AggregateResult> aggResult = [Select SUM(Amount__c) , accountId From contact Where accountId = : con.accountId and Amount_Type__c = 'Type A' Group By AccountId ];
    
        system.debug('aggregate..'+aggResult );
account acc = new account(id=con.accountId);
    
    FOR(AggregateResult ar : aggResult){
    
            acc.Amount_A__c = (Decimal)ar.get('expr0');
   }

list_acc.add(acc);
}

else if(con.Amount_Type__c == 'Type B' && con.accountId!=null)
{
}

}

} 


else if(Trigger.isDelete )
{

system.debug('undelete....'+trigger.old);

for(contact con : Trigger.old)
{

if(con.Amount_Type__c == 'Type A' && con.accountId!=null)
{

//Contact con1 = trigger.oldMap.get(con.id);
//account acc = m1.get(con1.accountId);


 List<AggregateResult> aggResult = [Select SUM(Amount__c) , accountId From contact Where accountId = : con.accountId and Amount_Type__c = 'Type A' Group By AccountId ];
    
        system.debug('aggregate..'+aggResult );
account acc = new account(id=con.accountId);
    
    FOR(AggregateResult ar : aggResult){
    
            acc.Amount_A__c = (Decimal)ar.get('expr0');
   }

list_acc.add(acc);
}

else if(con.Amount_Type__c == 'Type B' && con.accountId!=null)
{
}

}

}  }

update list_acc;
}
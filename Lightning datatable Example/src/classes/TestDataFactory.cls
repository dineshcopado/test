@isTest
public class TestDataFactory {
    public static List<Account> createAccounts(Integer numAccts) {
        List<Account> accts = new List<Account>();
        
        for(Integer i=0;i<numAccts;i++) {
            Account a = new Account(Name='TestAccount' + i);
            accts.add(a);
        }
        insert accts;
        
        return accts;
    }
    
     public static List<Contact> createContact(Integer numforms) {
     
     List<Contact> con_list = new List<Contact>();
     
     Account[] acc = createAccounts(1);
      for(Integer i=0;i<numforms;i++) {
            contact c =new  contact(accountId=acc[0].id,lastname='test'+i);
            con_list.add(c);
        }
        insert con_list;
        
        return con_list;
     
     }
     
     public static EmailTemplate createET(Integer numforms) {
     
     EmailTemplate et = new EmailTemplate();
et.isActive = true;
et.Name = 'name';
et.DeveloperName = 'test';
et.TemplateType = 'text';
et.FolderId = UserInfo.getUserId();

insert et;

return et;}
     }
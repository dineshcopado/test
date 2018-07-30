public class AddPrimaryContact implements Queueable{

public Contact con;
public String abbr;

public AddPrimaryContact(contact obj, String stateAbbr)
{
this.con=  obj;
this.abbr = stateAbbr;
}

  public void execute(QueueableContext context) {
  
  List<Account> lst_accs = [select id , BillingState from account where BillingState = :abbr limit 200];
  
  List<Contact> lst_con = new List<Contact>();
 
  for (account acc : lst_accs )
  {
  Contact cont = con.clone(false,false,false,false);
  cont.accountId = acc.Id;
  lst_con.add(cont);  
  

  }
  
  if(lst_con.size()>0) insert lst_con;
      
    
  
  }



}
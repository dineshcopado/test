@RestResource(urlMapping='/Accounts/*/contacts')//0011r00001pfP8U/contacts')

global class AccountManager{

@HttpGet
global static account getAccount(){


        RestRequest req = RestContext.request!=null?RestContext.request:new RestRequest();
        RestResponse res = RestContext.response!=null?RestContext.response:new RestResponse();
        
        String accID = req.requestURI.substringBetween('/Accounts/','/contacts');
        
        String name;
        
        String lastName;
        
        String firstName;
       
        
        Account[] acc= [select id,name, (select id , lastname from contacts) from account where id = :accID];
      
if(acc.size()<1) return null;

return acc[0];

}


}
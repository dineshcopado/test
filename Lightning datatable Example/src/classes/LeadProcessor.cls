global class LeadProcessor implements Database.Batchable<sObject> 
{

 global Database.QueryLocator start(Database.BatchableContext bc) {
 
  return Database.getQueryLocator(
            'SELECT ID from lead'
        );
 
 
 }
 
 global void execute(Database.BatchableContext bc, List<Lead> scope){
        // process each batch of records
        List<lead> leads= new List<lead>();
        
         String source = 'Dreamforce';
      
        
       // try
        //{
         for(Lead l : scope)
        {
       
        l.LeadSource = source ;
        leads.add(l);
        }
       
       update leads;
        
        
        
        //} catch(Exception ex){system.debug(ex);}
        }
        
         global void finish(Database.BatchableContext bc){}
 




}
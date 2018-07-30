public class CampingListController 
{


 @AuraEnabled
    public static List<Camping_Item__c> getItems() {
    
      // Check to make sure all fields are accessible to this user
        String[] fieldsToCheck = new String[] {
            'Name', 'Quantity__c', 'Price__c', 'Packed__c'
        };
        
        Map<String,Schema.SObjectField> fieldDescribeTokens = 
            Schema.SObjectType.Camping_Item__c.fields.getMap();
        
        for(String field : fieldsToCheck) {
            if( ! fieldDescribeTokens.get(field).getDescribe().isAccessible()) {
                throw new System.NoAccessException();
             
            } 
        }
    
        return [SELECT Id, Name, Quantity__c, Price__c, Packed__c
                FROM Camping_Item__c];
    }

 @AuraEnabled
    public static Camping_Item__c saveItem(Camping_Item__c[] ci) {
        // Perform isUpdatable() checking first, then
        upsert ci;
        return ci[0];
    }





}
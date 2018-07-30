({
    /*
     * This finction defined column header
     * and calls getAccounts helper method for column data
     * editable:'true' will make the column editable
     * */
doInit : function(component, event, helper) {        
        component.set('v.columns', [
            
            {label: 'Contact Phone', fieldName: 'phone', type: 'phone'}
        ]);      
    
    component.set('v.mydata', [{
               
                phone: '8428575275'
                
               
        }]);
       // helper.getAccounts(component, helper);
         //   helper.fetchPickListVal(component, 'Email_Type__c', 'ratingPicklistOpts');

    },
doInit1 : function(component, event, helper) {        
        
       
    console.log('pick..');
          //  helper.fetchPickListVal(component, 'Email_Type__c', 'ratingPicklistOpts');

    },
    /*
     * This function is calling saveDataTable helper function
     * to save modified records
     * */
    onSave : function (component, event, helper) {
        helper.saveDataTable(component, event, helper);
    },
   
})
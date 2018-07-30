({
    createItem : function(cmp) {
        
        var validItem = component.find('expenseform').reduce(function (validSoFar, inputCmp) {
            // Displays error messages for invalid fields
            inputCmp.showHelpMessageIfInvalid();
            return validSoFar && inputCmp.get('v.validity').valid;
        }, true);
        // If we pass error checking, do some real work
        if(validItem){
            // Create the new expense
            var newItem = component.get("v.newItem");
            var Items = component.get("v.Items");
            
            // Copy the expense to a new object
            // THIS IS A DISGUSTING, TEMPORARY HACK
            var newItemPush = JSON.parse(JSON.stringify(newItem));
            
            Items.push(newItemPush);
            if(Items !=null)
            {
                component.set("v.Items",Items);
                
                var updateEvent = component.getEvent("addItemEvent");
                updateEvent.setParams({ "item": Items });
                updateEvent.fire();
                
                component.set("v.newItem", { 'sobjectType': 'Camping_Item__c',
                                            'Price__c': 0,
                                            'Quantity__c': 0,
                                            'Packed__c': false }	);
                
            }
            
        }
        
    }
})
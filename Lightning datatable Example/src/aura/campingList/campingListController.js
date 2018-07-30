({
	    // Load expenses from Salesforce
    doInit: function(component, event, helper) {
        // Create the action
        var action = component.get("c.getItems");
        // Add callback behavior for when response is received
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.Items", response.getReturnValue());
            }
            else {
                console.log("Failed with state: " + state);
            }
        });
        // Send action off to be executed
        $A.enqueueAction(action);
    },
    
    handleAdditem : function(component, event, helper) {
        
         var Items = event.getParam("addItem");
        
         var action = component.get("c.saveItem");
        action.setParams({
            "ci": Items
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                var item = component.get("v.Items");
                   var newItemPush = JSON.parse(JSON.stringify(response.getReturnValue()));
                item.push(newItemPush);
                component.set("v.Items", item);
            }
        });
        $A.enqueueAction(action);
         },
    
    
})
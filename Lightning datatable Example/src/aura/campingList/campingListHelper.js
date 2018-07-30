({
	    createItem: function(component, Items) {
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
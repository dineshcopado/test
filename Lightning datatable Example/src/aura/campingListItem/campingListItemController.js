({
	packItem : function(component, event, helper) {
        
         var btnClicked = event.getSource();         // the button
        var btn = btnClicked.get("v.disabled"); // the button's label
        component.set("v.disabled", true); 
        component.set("v.item.Packed__c", true);
		
	},
    
   

})
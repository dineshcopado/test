({
	NavigationRec : function(component, event, helper) {
		
        component.find("navId").navigate({
            type: 'standard__recordPage',
            attributes: {
                recordId : '5001r00001zYLMsAAO',
                actionName: 'view',
                objectApiName: 'Case'
            }}, true);
	
    }})
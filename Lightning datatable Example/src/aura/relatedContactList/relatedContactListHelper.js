({
    getAccounts : function(component, event, helper) {
        var action = component.get("c.getAccounts");
        var val = component.get("v.recordId");
        action.setParams({
              'accId' : val,
              'objName' : 'Contact',
              'fieldSetName' : 'contactFS'
        });
        action.setCallback(this,function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.columns", response.getReturnValue().lstDataTableColumns);
                component.set("v.data", response.getReturnValue().lstDataTableData);
                console.log('v.data...'+component.get("v.data"));
            }
        });
        $A.enqueueAction(action);
    },

    /*
     * This function get called when user clicks on Save button
     * user can get all modified records
     * and pass them back to server side controller
     * */
    saveDataTable : function(component, event, helper) {
        var editedRecords =  component.find("accountDataTable").get("v.draftValues");
        console.log('editedRecords...'+editedRecords);
        var totalRecordEdited = editedRecords.length;
        var action = component.get("c.updateAccounts");
        action.setParams({
            'editedConList' : editedRecords
        });
        action.setCallback(this,function(response) {
            var state = response.getState();
            if (state === "SUCCESS") {
                //if update is successful
                if(response.getReturnValue() === true){
                     $A.get("e.force:refreshView").fire();
                    helper.getAccounts(component, event, helper);
                    component.find("accountDataTable").set("v.draftValues",null);
                   
                    helper.showToast({
                        "title": "Record Update",
                        "type": "success",
                        "message": totalRecordEdited+" Contact Records Updated"
                    });
                   
                } else{ //if update got failed
                    helper.showToast({
                        "title": "Error!!",
                        "type": "error",
                        "message": "Error in update"
                    });
                }
            }
        });
        $A.enqueueAction(action);
    },

    /*
     * Show toast with provided params
     * */
    showToast : function(params){
        var toastEvent = $A.get("e.force:showToast");
        if(toastEvent){
            toastEvent.setParams(params);
            toastEvent.fire();
        } else{
            alert(params.message);
        }
    },

    /*
     * reload data table
     * */
    reloadDataTable : function(){
    var refreshEvent = $A.get("e.force:refreshView");
        if(refreshEvent){
            refreshEvent.fire();
        }
    },
    
    fetchPickListVal: function(component, fieldName, picklistOptsAttributeName) {
        var action = component.get("c.getselectOptions");
        action.setParams({
            "objObject": component.get("v.objInfoForPicklistValues"),
            "fld": 'Email_Type__c'
        });
        var opts = [];
        action.setCallback(this, function(response) {
            console.log('response.getState '+response.getState());
            if (response.getState() == "SUCCESS") {
                var allValues = response.getReturnValue();
 console.log('allValues '+allValues);
                if (allValues != undefined && allValues.length > 0) {
                    opts.push({
                        class: "uiInput uiInputSelect forceInputPicklist uiInput--default uiInput--select",
                        label: "--- None ---",
                        value: ""
                    });
                }
                debugger;
                for (var i = 0; i < allValues.length; i++) {
                    opts.push({
                        class: "uiInput uiInputSelect forceInputPicklist uiInput--default uiInput--select",
                        label: allValues[i],
                        value: allValues[i]
                    });
                }
                component.set("v." + picklistOptsAttributeName, opts);
            }
        });
        $A.enqueueAction(action);
    },
})
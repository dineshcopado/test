({
    init: function (cmp, event, helper) {
        cmp.set('v.columns', [
            {label: 'Account Name', fieldName: 'name', type: 'text'},
            {label: 'Description', fieldName: 'Description', type: 'text'}
           
        ]);

        var fetchData = [{
            "name": "XYZ",
            "Description" : "testing"
            
        }];

debugger;
       
         cmp.set('v.data', fetchData);
    }
})
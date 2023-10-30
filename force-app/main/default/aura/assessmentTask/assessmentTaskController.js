({
    onChange : function(component, event, helper) {
        var status_1 =  component.find('select').get('v.value');
        console.log("Status : " + status_1);
        if (status_1 == "") {
            alert("Select Any One Value");
        }
        else{
            var create = component.get("c.getAccount");
            create.setParams({
                "Status":status_1
            });
            $A.enqueueAction(create);
        }
    }
})

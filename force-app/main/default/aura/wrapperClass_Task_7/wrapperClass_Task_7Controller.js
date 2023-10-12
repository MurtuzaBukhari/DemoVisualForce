({
    doInit : function(component, event, helper) {
        var create = component.get("c.getAccount");
        create.setCallback(this,function(response){
            var state = response.getState();
            if (state == "SUCCESS") {
                var accList = response.getReturnValue();
                component.set("v.wrapperClass",accList)
            }
        });
        $A.enqueueAction(create);
    }
})

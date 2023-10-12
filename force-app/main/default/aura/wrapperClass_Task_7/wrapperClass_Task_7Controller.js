({
    doInit : function(component, event, helper) {
        var create = component.get("c.getAccount");
        create.setCallback(this,function(response){
            var state = response.getState();
            if (state == "SUCCESS") {
                var accList = response.getReturnValue();
                console.log("List",accList);
                component.set("v.wrapperClass",accList)
                accList.forEach(list => {
                    // console.log(list.objcon);
                });
                // console.log("Contact : ",accList[8].objcon[4]);
            }
        });
        $A.enqueueAction(create);
    }
})

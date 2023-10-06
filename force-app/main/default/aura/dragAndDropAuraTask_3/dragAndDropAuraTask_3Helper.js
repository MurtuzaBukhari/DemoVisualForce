({
    updateAccount1 : function(component, event, helper,conId1,accId1) {
        var create = component.get("c.updateAccountId1");
        console.log("Acc "+ accId1);
        console.log("con "+ conId1);
        create.setParams({
            "ConId":conId1,
            "accId":accId1
        });
        create.setCallback(this, function(conRecord) {            
            console.log("Record"+conRecord);
            var sT = conRecord.getState();
            console.log("State"+sT);
            var conId = conRecord.getReturnValue();
            console.log("id"+conId);
            if (sT == "SUCCESS") {
                component.set("v.paginationList_1",conRecord.getReturnValue());
                alert("CONTACT UPLOADED SUCCESSFULY !....");
            }
            else{
                alert("ERROR ACCURED");
            }
        });
        $A.enqueueAction(create);
    },
    updateAccount2 : function(component, event, helper,conId1,accId1) {
        var create = component.get("c.updateAccountId2");
        create.setParams({
            "ConId":conId1,
            "accId":accId1
        });
        create.setCallback(this, function(conRecord) {            
            console.log("Record"+conRecord);
            var sT = conRecord.getState();
            console.log("State"+sT);
            var conId = conRecord.getReturnValue();
            console.log("id"+conId);
            if (sT == "SUCCESS") {
                component.set("v.paginationList_1",conRecord.getReturnValue());
                alert("CONTACT UPLOADED SUCCESSFULY !....");
            }
            else{
                alert("ERROR ACCURED");
            }
        });
        $A.enqueueAction(create);
    }
})

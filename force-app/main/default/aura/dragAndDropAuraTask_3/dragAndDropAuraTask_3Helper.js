({
    updateAccount1 : function(component, event, helper,conId1,accId1) {
        console.log("Con 1"+conId1);
        console.log("acc 1"+accId1);
        var create = component.get("c.updateAccountId1");
        // console.log("Acc "+ accId1);
        // console.log("con "+conId1);
        create.setParams({
            "ConId":conId1,
            "accId":accId1
        });
        create.setCallback(this, function(conRecord) {            
            // console.log("Record"+conRecord);
            var sT = conRecord.getState();
            // console.log("State",sT);
            var conId = conRecord.getReturnValue();
            // console.log("id",conId);
            if (sT == "SUCCESS") {
                component.set("v.paginationList_1",conRecord.getReturnValue());
                alert("CONTACT UPLOADED SUCCESSFULY !....");
            }
            else{
                alert("ERROR ACCURED");
            }
        });
        $A.enqueueAction(create);
        var acc2 = component.find("input2").get("v.value");
        console.log("Acc Id 2 "+acc2);
        var create = component.get("c.getAccountId2");
        create.setParams({
            "searchKey2":acc2
        });
        create.setCallback(this, function(conRecord) {            
            // console.log("Record"+conRecord);
            var sT = conRecord.getState();
            // console.log("State"+sT);
            var conId = conRecord.getReturnValue();
            // console.log("id"+conId);
            if (sT == "SUCCESS") {
                component.set("v.paginationList_2",conRecord.getReturnValue());
                // alert("CONTACT UPLOADED SUCCESSFULY !....");
            }
            else{
                alert("ERROR ACCURED");
            }
        });
        $A.enqueueAction(create);
    },
    updateAccount2 : function(component, event, helper,conId1,accId1) {
        console.log("Con 2"+conId1);
        console.log("acc 2"+accId1);
        var create = component.get("c.updateAccountId2");
        create.setParams({
            "ConId":conId1,
            "accId":accId1
        });
        create.setCallback(this, function(conRecord) {            
            // console.log("Record"+conRecord);
            var sT = conRecord.getState();
            // console.log("State"+sT);
            var conId = conRecord.getReturnValue();
            // console.log("id"+conId);
            if (sT == "SUCCESS") {
                component.set("v.paginationList_2",conRecord.getReturnValue());
                alert("CONTACT UPLOADED SUCCESSFULY !....");
            }
            else{
                alert("ERROR ACCURED");
            }
        });
        $A.enqueueAction(create);
        var acc1 = component.find("input1").get("v.value");
        console.log("Acc Id 1 "+acc1);
        var create = component.get("c.getAccountId1");
        create.setParams({
            "searchKey1":acc1
        });
        create.setCallback(this, function(conRecord) {            
            // console.log("Record"+conRecord);
            var sT = conRecord.getState();
            // console.log("State"+sT);
            var conId = conRecord.getReturnValue();
            // console.log("id"+conId);
            if (sT == "SUCCESS") {
                component.set("v.paginationList_1",conRecord.getReturnValue());
                // alert("CONTACT UPLOADED SUCCESSFULY !....");
            }
            else{
                alert("ERROR ACCURED");
            }
        });
        $A.enqueueAction(create);
    }
})

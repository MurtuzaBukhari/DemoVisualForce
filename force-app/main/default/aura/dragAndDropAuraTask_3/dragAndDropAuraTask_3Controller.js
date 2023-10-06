({
    searchAcc1 : function(component, event, helper) {
        var acc1 = component.find("input1").get("v.value");
        console.log("Acc Id 1 "+acc1);
        var create = component.get("c.getAccountId1");
        create.setParams({
            "searchKey1":acc1
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
    searchAcc2 : function(component, event, helper) {
        var acc2 = component.find("input2").get("v.value");
        console.log("Acc Id 2 "+acc2);
        var create = component.get("c.getAccountId2");
        create.setParams({
            "searchKey2":acc2
        });
        create.setCallback(this, function(conRecord) {            
            console.log("Record"+conRecord);
            var sT = conRecord.getState();
            console.log("State"+sT);
            var conId = conRecord.getReturnValue();
            console.log("id"+conId);
            if (sT == "SUCCESS") {
                component.set("v.paginationList_2",conRecord.getReturnValue());
                alert("CONTACT UPLOADED SUCCESSFULY !....");
            }
            else{
                alert("ERROR ACCURED");
            }
        });
        $A.enqueueAction(create);
    },
    dragStart : function(component, event, helper) {
        console.log("Id"+event.target.id);
        event.dataTransfer.setData("Text",event.target.id);        
    },
    allowDrop : function(component, event, helper) {
        event.preventDefault();
    },
    onAcc1Drop : function(component, event, helper) {
        var acc1 = component.find("input1").get("v.value");
        helper.updateAccount1(component, event, helper,event.dataTransfer.getData("Text",event.target.id),acc1);
    },
    onAcc2Drop : function(component, event, helper) {
        var acc2 = component.find("input2").get("v.value");
        helper.updateAccount1(component, event, helper,event.dataTransfer.getData("Text",event.target.id),acc2);   
    }
})

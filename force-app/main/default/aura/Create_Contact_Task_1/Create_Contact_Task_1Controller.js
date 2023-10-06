({
    createCon : function(component, event, helper) {
        var conName = component.find("conName").get("v.value");
        var conNumber = component.find("conNumber").get("v.value");
        // alert("Submit");
        console.log("Contact Name :"+ conName);
        console.log("Contact Number :"+ conNumber);

        var create = component.get("c.conCreate");
        create.setParams({
            "conLastName":conName,
            "conPhoneNumber":conNumber
        });

        create.setCallback(this, function(conRecord) {            
            console.log("Record"+conRecord);
            var sT = conRecord.getState();
            console.log("State"+sT);
            var conId = conRecord.getReturnValue();
            console.log("id"+conId);
            if (sT == "SUCCESS") {
                alert("CONTACT CREATED SUCCESSFULY !....");
            }
            else{
                alert("ERROR ACCURED");
            }
        });
        $A.enqueueAction(create);
        var clearName =  component.find("conName").set("v.value","");
        var clearNumber =  component.find("conNumber").set("v.value","");
        console.log("Name"+clearName);
        console.log("Number"+clearNumber);
    }
})

({
    show: function (component, event, helper) {
        var val1 = component.get("v.steps");
        var count = parseInt(val1);
        var accId;
        var conId;
        var eId;
        if (count == 1) {
            count = count + 1;
            component.set("v.steps", '' + count);
            var accName = component.find("name").get("v.value");
            var accNumber = component.find("phone").get("v.value");
            var create_1 = component.get("c.accCreate");
            create_1.setParams({
                "accName": accName,
                "accPhoneNumber": accNumber
            });

            create_1.setCallback(this, function (conRecord) {
                console.log("Record" + conRecord);
                var sT = conRecord.getState();
                console.log("State" + sT);
                accId = conRecord.getReturnValue();
                console.log("id : " + accId);
                component.set("v.AccId",accId);
                if (sT == "SUCCESS") {
                    alert("CONTACT CREATED SUCCESSFULY !....");
                }
                else {
                    alert("ERROR ACCURED");
                }
            });
            $A.enqueueAction(create_1);
            console.log("Coount" + count);
        }
        else if (count == 2) {
            count = count + 1;
            component.set("v.steps", '' + count);
            var conLname = component.find("lname").get("v.value");
            var conFname = component.find("fname").get("v.value");
            // alert("Submit");`
            var accId_1 = component.get("v.AccId");
            console.log("id : " + accId_1);
            debugger;
            console.log("Contact Name :"+ conLname);
            console.log("Contact Number :"+ conFname);
            var create_2 = component.get("c.conCreate");
            create_2.setParams({
                "conLastName": conLname,
                "conFirstName": conFname,
                "accId": accId_1
            });

            create_2.setCallback(this, function (conRecord) {
                console.log("Record" + conRecord);
                var sT = conRecord.getState();
                console.log("State" + sT);
                conId = conRecord.getReturnValue();
                component.set("v.ConId",conId);
                console.log("id" + conId);
                if (sT == "SUCCESS") {
                    alert("CONTACT CREATED SUCCESSFULY !....");
                }
                else {
                    alert("ERROR ACCURED");
                }
            });
            $A.enqueueAction(create_2);
        }
        else{
            var subject = component.find("sub").get("v.value");
            // alert("Submit");
            
            // console.log("id : " + accId);
            // console.log("Contact Name :"+ conLname);
            // console.log("Contact Number :"+ conFname);
            var conId_1 = component.get("v.ConId");
            var create_3 = component.get("c.eventCreate");
            create_3.setParams({
                "subject": subject,
                "conId": conId_1
            });

            create_3.setCallback(this, function (conRecord) {
                console.log("Record" + conRecord);
                var sT = conRecord.getState();
                // console.log("State" + sT);
                eId = conRecord.getReturnValue();
                // console.log("id" + conId);
                if (sT == "SUCCESS") {
                    alert("CONTACT CREATED SUCCESSFULY !....");
                }
                else {
                    alert("ERROR ACCURED");
                }
            });
            $A.enqueueAction(create_3);
    
        }
    },
    call: function (component, event, helper) {
        var val1 = component.get("v.steps");
        var count = parseInt(val1);
        count = count - 1;
        component.set("v.steps", '' + count);
    },
})

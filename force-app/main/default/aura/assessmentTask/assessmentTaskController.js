// ({
//     onChange : function(component, event, helper) {
//         var status_1 =  component.find('select').get('v.value');
//         console.log("Status : " + status_1);
//         if (status_1 == "") {
//             alert("Select Any One Value");
//         }
//         else{
//             var create = component.get("c.getAccount");
//             create.setParams({
//                 "Status":status_1
//             });
//         }
//         create.setCallback(this,function(response){
//             var state = response.getState();
//             if (state == "SUCCESS") {
//                 var accList = response.getReturnValue();
//                 console.log("List",accList);
//                 component.set("v.wrapperClass",accList);
//                 // accList.forEach(list => {
//                 //     // console.log(list.objcon);
//                 // });
//                 // console.log("Contact : ",accList[8].objcon[4]);
//             }
//         });
//         $A.enqueueAction(create);
//     },
//     handleClick : function(component, event, helper) {
//         var id = event.target.value;
//         console.log("Id :"+id);
//         var create_2 = component.get("c.getContact");
//             create_2.setParams({
//                 "conId":id
//             });
//             create_2.setCallback(this,function(response){
//                 var state = response.getState();
//                 if (state == "SUCCESS") {
//                     var conList = response.getReturnValue();
//                     console.log("List",conList);
//                     component.set("v.contact",conList);
//                     // console.log("Hello Hi");
//                     // conList.forEach(list => {
//                     //     console.log(list.Account.Name);
//                     // });
//                     // console.log("Contact : ",accList[8].objcon[4]);
//                 }
//             });
//             $A.enqueueAction(create_2);
//     }
// })
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
        }
        create.setCallback(this,function(response){
            var state = response.getState();
            if (state == "SUCCESS") {
                var accList = response.getReturnValue();
                console.log("List",accList);
                component.set("v.wrapperClass",accList);
                accList.forEach(list => {
                    // console.log(list.objcon);
                });
                // console.log("Contact : ",accList[8].objcon[4]);
            }
        });
        $A.enqueueAction(create);
    }
})

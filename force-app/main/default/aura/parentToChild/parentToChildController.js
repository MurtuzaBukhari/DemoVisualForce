({
    doInit : function(component, event, helper) {
        var mes = event.getParam("message");
        console.log("image : ",mes);
        component.set("v.image",mes);
    }
})

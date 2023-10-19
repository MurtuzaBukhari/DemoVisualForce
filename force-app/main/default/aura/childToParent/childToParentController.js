({
    save: function (component, event, helper) {
        var cmpEvent = component.getEvent("sampleComponentEvent");
        var file = component.find("fileId").get("v.files");
        var Upload = file[0];
        console.log("Files : ", Upload);
        var reader = new FileReader();
        reader.onload = function () {
            var fileUp = reader.result;
            cmpEvent.setParams({
                "message": fileUp
            });
            cmpEvent.fire();
        }
        reader.readAsDataURL(Upload);
    },
})

({
    save: function (component, event, helper) {
        var file = component.find("fileId").get("v.files");
        var Upload = file[0];
        console.log("Files : ",Upload);
        var reader = new FileReader();
        console.log("Hello");
        reader.onload = function() {
            var fileUp = reader.result;
            component.set("v.image",fileUp);
            console.log("Images" + fileUp);
        }
        reader.readAsDataURL(Upload); 
    },
    
})

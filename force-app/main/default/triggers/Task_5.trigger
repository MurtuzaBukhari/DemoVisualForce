trigger Task_5 on Account (after update,after delete , after insert , before insert ,before update , before delete) {
    if (Trigger.isUpdate) {
        if (Trigger.isAfter) {
            task_5.sendEmails(Trigger.new, Trigger.oldMap);
        }   
    }
    // if (Trigger.isUpdate) {
    //     if (Trigger.isBefore) {
    //        task_5.Task_13(Trigger.new);
    //     }
    // }
    if (Trigger.isInsert) {
        if (Trigger.isBefore) {
            task_5.Task_7(Trigger.new);
            task_5.Task_10(Trigger.new);
            task_5.Task_12(Trigger.new);
        }
    }
    if (Trigger.isInsert && Trigger.isUpdate) {
        if (Trigger.isAfter) {
            task_5.Task_9(Trigger.new);
        }
    }
}
// SELECT LastName, Email FROM Contact WHERE AccountId IN :setAccountIds AND Email != null
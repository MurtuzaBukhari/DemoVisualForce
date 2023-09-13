trigger Task_3 on Opportunity (before update,before insert , before delete , after update , after insert , after delete) {
    if (Trigger.isUpdate && Trigger.isBefore) {
        task_3.beforeUpdate(Trigger.new);
    }
    if (Trigger.isUpdate || Trigger.isInsert) {
        if (Trigger.isBefore) {
            task_3.beforeUpdate_2(Trigger.new);
        }
    }
    if (Trigger.isUpdate) {
        if (Trigger.isAfter) {
            List<Task> taskList = task_3.createTasksOnOpportunityNameChange(Trigger.new, Trigger.oldMap);
            if (!taskList.isEmpty()) {
                insert taskList;
            }
        }
    }
}
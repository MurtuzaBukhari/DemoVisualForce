trigger Task_2 on Lead (before insert) {
    if (Trigger.isInsert && Trigger.isBefore) {
        task_1.beforeInsert(Trigger.new);
    } 
}
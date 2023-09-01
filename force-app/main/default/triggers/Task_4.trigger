trigger Task_4 on Opportunity (before insert,before update) {
    if (Trigger.isUpdate || Trigger.isInsert) {
        if (Trigger.isBefore) {
            for (Opportunity ld : Trigger.new) {
                ld.Type = 'New Customer';
            }
        }
    }
}
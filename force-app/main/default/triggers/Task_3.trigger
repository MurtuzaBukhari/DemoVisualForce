trigger Task_3 on Opportunity (before update) {
    if (Trigger.isUpdate) {
        if (Trigger.isBefore) {
            for (Opportunity ld : Trigger.new) {
                ld.StageName='Prospecting';
                ld.CloseDate=Date.Today()+15;
            }
        }
    }
}
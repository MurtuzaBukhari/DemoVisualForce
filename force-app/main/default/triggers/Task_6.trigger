trigger Task_6 on Opportunity (after update ) {
    // List<Opportunity> oppList = [SELECT Name,Id FROM Opportunity];
    // Map<Id, Opportunity> oldMap = new Map<Id, Opportunity>();
    List<Task> taskList = new List<Task>();
    for (Opportunity opp : Trigger.new) {
        if (opp.Name != Trigger.oldMap.get(opp.Id).Name) {
            Task tsk = new Task();
            tsk.WhatId = opp.Id;
            tsk.Subject = 'Demo Trigger';
            tsk.Priority='Normal';
            tsk.Status = 'Not Started';
            tsk.OwnerId = opp.OwnerId;
            taskList.add(tsk);
        }
    }
    if (!taskList.isEmpty()) {
        insert taskList;
    }
}
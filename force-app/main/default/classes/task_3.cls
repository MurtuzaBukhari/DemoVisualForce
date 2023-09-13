public class task_3 {
    
    // Task_3
        public static void beforeUpdate(List<Opportunity> updatedOpportunities) {
            for (Opportunity opp : updatedOpportunities) {
                opp.StageName = 'Prospecting';
                opp.CloseDate = Date.today()+15;
            }
        }

        // Task_4
        public static void beforeUpdate_2(List<Opportunity> updatedOpportunities) {
            for (Opportunity ld : updatedOpportunities) {
                ld.Type = 'New Customer';
            }
        }
        
        // Task_6
            public static List<Task> createTasksOnOpportunityNameChange(List<Opportunity> newOpportunities, Map<Id, Opportunity> oldOpportunityMap) {
                List<Task> taskList = new List<Task>();
                
                for (Opportunity newOpp : newOpportunities) {
                    Opportunity oldOpp = oldOpportunityMap.get(newOpp.Id);
                    
                    if (newOpp.Name != oldOpp.Name) {
                        Task newTask = new Task();
                        newTask.WhatId = newOpp.Id;
                        newTask.Subject = 'Demo Trigger';
                        newTask.Priority = 'Normal';
                        newTask.Status = 'Not Started';
                        newTask.OwnerId = newOpp.OwnerId;
                        taskList.add(newTask);
                    }
                }
                
                return taskList;
            }
        
        
    
}
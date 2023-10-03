global class scheduledClassTask_2 implements Schedulable {
    global void execute(SchedulableContext ctx){
        List<Account> accList = new List<Account>();
        List<Account> accList_1 = [SELECT Id,Name,Rating FROM Account];
        for (Account acc : accList_1) {
            acc.Rating = 'Warm';
            accList.add(acc);
        }
        update accList;
    }
}
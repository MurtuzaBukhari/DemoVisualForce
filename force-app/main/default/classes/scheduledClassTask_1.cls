global class scheduledClassTask_1 implements Schedulable {
    global void execute(SchedulableContext ctx){
        List<Opportunity> oppList = new List<Opportunity>();
        for (Integer i = 0; i < 10; i++) {
            Opportunity opp = new Opportunity();
            opp.Name = 'Schedulable'+i;
            opp.CloseDate = Date.today();
            opp.StageName = 'Prospecting';
            oppList.add(opp);
        }
        insert oppList;
    }
}
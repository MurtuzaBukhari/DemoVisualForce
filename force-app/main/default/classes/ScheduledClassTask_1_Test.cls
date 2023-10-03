@isTest
public class ScheduledClassTask_1_Test {
    @isTest
    private static void scheduledTask_1_Test(){
        String time_1 = '0 0 0 ? * * *';
        Opportunity opp = new Opportunity();
        opp.Name= 'test';
        opp.CloseDate = Date.today();
        opp.StageName = 'Prospecting';
        insert opp;
        Test.startTest();
       
        scheduledClassTask_1 task = new scheduledClassTask_1();
        String jobId = System.schedule('Test',time_1,task);
        Test.stopTest();
    }
}
@isTest
public class ScheduledClassTask_2_Test {
    @isTest
    private static void scheduledTask_2_Test(){
        String time_1 = '0 0 0 ? * * *';
        Account acc =new Account();
        acc.Name= 'Test';
        insert acc;
        acc.Name = 'test 1';
        update acc;
        Test.startTest();
        scheduledClassTask_2 task = new scheduledClassTask_2();
        String jobId = System.schedule('Test',time_1,task);
        Test.stopTest();
    }
}
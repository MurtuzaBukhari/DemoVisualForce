@isTest
public class BatchClassTask_2_Test {
    @isTest
    private static void batchTask_2_Test(){
        Account acc = new Account();
        acc.Name='test';
        insert acc;
        Test.startTest();
        batchClassTask_2 task = new batchClassTask_2();
        Id batchId = Database.executeBatch(task);
        Test.stopTest();
    }
}
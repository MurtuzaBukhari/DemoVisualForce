@isTest
public class BatchClassTask_1_Test {
    @isTest
    private Static void  batchTask_1_Test(){
        Account acc = new Account();
        acc.Name = 'test';
        insert acc;
        Opportunity opp = new Opportunity();
        opp.Name='test_1';
        opp.StageName ='Prospecting';
        opp.CloseDate = System.today();
        opp.AccountId = acc.Id;
        insert opp;

        Test.startTest();
        batchClassTask_1 task = new batchClassTask_1();
        Id batchId = Database.executeBatch(task);
        Test.stopTest();
    }
}
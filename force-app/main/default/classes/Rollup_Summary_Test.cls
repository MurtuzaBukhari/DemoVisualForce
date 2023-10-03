@isTest
public class Rollup_Summary_Test {
    @isTest
    private static void rollup(){
        Account acc = new Account();
        acc.Name = 'Test';
        insert acc;
        Account acc_1 = new Account();
        acc_1.Name = 'Test 1';
        insert acc_1;
        Contact con = new Contact();
        con.LastName = 'Test';
        con.Amount_Trigger__c=50;
        con.AccountId=acc.Id;
        insert con;
        con.AccountId=acc_1.Id;
        update con;
        Contact con_1 = new Contact();
        con_1.LastName = 'test';
        insert con_1;
        delete con;
    }
}
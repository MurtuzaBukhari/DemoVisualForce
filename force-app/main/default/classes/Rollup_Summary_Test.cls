@isTest
public class Rollup_Summary_Test {
    @isTest
    private static void rollup(){
        Account acc = new Account();
        acc.Name = 'Test';
        insert acc;
        Contact con = new Contact();
        con.LastName = 'Test';
        con.Amount_Trigger__c=50;
        con.AccountId=acc.Id;
        insert con;
        
    }
}
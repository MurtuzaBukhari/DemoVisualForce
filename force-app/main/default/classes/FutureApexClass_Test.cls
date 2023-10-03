@isTest
public class FutureApexClass_Test {
    @isTest
    private static void Future_Test(){
        Opportunity opp = new Opportunity();
        opp.Name = 'Test';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today();

        Test.startTest();
        futureApexClass.saveImages();
        Test.stopTest();
    }
}
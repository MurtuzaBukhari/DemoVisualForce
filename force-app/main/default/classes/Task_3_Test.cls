@isTest
public class Task_3_Test{
    @isTest
    private static void task_3(){
        Opportunity opp = new Opportunity();
        opp.Name = 'Test';
        opp.StageName='Prospecting';
        opp.CloseDate=Date.today();

        insert opp;

        opp.Name = 'Test Demo';
        update opp;
        Opportunity updateOpp = [SELECT Name,StageName FROM Opportunity WHERE Id =: opp.Id];
        System.assertEquals('Prospecting',updateOpp.StageName);
    }
}

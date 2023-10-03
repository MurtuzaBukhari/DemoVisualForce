@isTest
public class ContactClassTrigger_Test{
    @isTest
    private static void Task_8(){
        Contact con = new Contact();
        con.LastName = 'Test';
        insert con;
        delete con;
        // Contact updatecon = [SELECT Name FROM Contact WHERE Id =: con.Id];
        // System.assertEquals('Prospecting',updateOpp.StageName);
    }
}
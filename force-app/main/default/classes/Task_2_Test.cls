@isTest
public class Task_2_Test {
    @isTest
    Private static void task_2(){
        Lead ld= new Lead();
        ld.LastName = 'Test';
        ld.Company='MVClouds';
        ld.Status='Working - Contacted';

        insert ld;

        Lead newLead = [SELECT Name,Rating FROM Lead WHERE Id =: ld.Id];
        System.assertEquals('Hot',newLead.Rating);
    }
}

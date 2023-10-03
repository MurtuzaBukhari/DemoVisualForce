@isTest
public class Task_5_Test{
    @isTest
    private static void task_5(){
        Account acc = new Account();
        acc.Name = 'Murtuza';
        insert acc;

        Contact con = new Contact();
        con.AccountId = acc.Id;
        con.LastName = 'test';
        con.Email = 'test@gmail.com';


        insert con;
        acc.Name = 'Mr' + acc.Name;
        update acc;
        

        delete acc;
    }
}

public class account_Contact_Event_Class {
    @AuraEnabled
    public static String accCreate(String accName,String accPhoneNumber){
        // System.debug('Last Name:'+conLastName);
        // System.debug('Phone Number:'+conPhoneNumber);
        Account acc = new Account();
        acc.Name = accName;
        acc.Phone = accPhoneNumber;
        insert acc;
        // System.debug('id'+con.Id);
        return acc.id;
    }
    @AuraEnabled
    public static String conCreate(String conLastName,String conFirstName,Id accId){
        // System.debug('Last Name:'+conLastName);
        // System.debug('Phone Number:'+conPhoneNumber);
        System.debug('Account Id : '+accId);
        Contact con = new Contact();
        con.LastName = conLastName;
        con.FirstName = conFirstName;
        con.AccountId = accId;
        insert con;
        // System.debug('id'+con.Id);
        return con.id;
    }
    @AuraEnabled
    public static String eventCreate(String subject,Id conId){
        System.debug('Contact Id : '+conId);
        Event e = new Event();
        e.WhoId = conId;
        e.Subject = subject;
        e.StartDateTime = System.now();
        e.EndDateTime = e.StartDateTime.addDays(10);
        insert e;
        return e.id;
    }
}
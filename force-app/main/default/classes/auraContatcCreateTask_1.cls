public class auraContatcCreateTask_1 {
    @AuraEnabled
    public static String conCreate(String conLastName,String conPhoneNumber){
        System.debug('Last Name:'+conLastName);
        System.debug('Phone Number:'+conPhoneNumber);
        Contact con = new Contact();
        con.LastName = conLastName;
        con.Phone = conPhoneNumber;
        insert con;
        // System.debug('id'+con.Id);
        return con.id;
    }
}
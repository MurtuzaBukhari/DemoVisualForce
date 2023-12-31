public class Sheep_Problem {
    public static void updateContactAccount(List<Contact> newContacts, Map<Id, Contact> oldContactsMap) {
        Set<Id> str = new Set<Id>();
        Set<Id> str_1 = new Set<Id>();

       
        for (Contact con : newContacts) {
            if (con.AccountId != oldContactsMap.get(con.Id).AccountId) {
                str.add(con.AccountId);
                str_1.add(oldContactsMap.get(con.Id).AccountId);
            }
        }

        List<Contact> conList = [SELECT Id, Name, AccountId FROM Contact WHERE AccountId IN :str_1];
        List<Account> accList = [SELECT Id, Name FROM Account WHERE Id IN :str];

        List<Contact> conUpdate = new List<Contact>();

        
        for (Contact conToUpdate : conList) {
            if (conToUpdate.AccountId != null) {
                for (Account acc : accList) {
                    conToUpdate.AccountId = acc.Id;
                    conUpdate.add(conToUpdate);
                }
            }
        }

        
    
            update conUpdate;

    }
}
public class ContactList {
    @AuraEnabled
    public static  List<Contact> getContact()

    {
    
    return [SELECT Id,LastName,AccountId,Phone,Account.Name FROM Contact];
    
    }
    
    // This method used for reterived  the list of opportunity records based on the search string
    
    @AuraEnabled
    
    public static List<Contact> getByName(String searchKey) {
    
    // String name = '%' + searchKey + '%';
    
    return [SELECT Id,LastName,AccountId,Phone FROM Contact WHERE Account.Name LIKE :searchKey];
    
    }
    
    }
        

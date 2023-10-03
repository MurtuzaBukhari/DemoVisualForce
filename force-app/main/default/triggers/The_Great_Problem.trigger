trigger The_Great_Problem on Contact (before insert,before update) {
    System.debug('Trigger is running');
    
    List<Contact> conList = new List<Contact>();
    
    for (Contact contact : Trigger.new) {
        if(Contact.AccountId != null){
            Account acc = [SELECT Id, Max_Amount__c FROM Account WHERE Id =: contact.AccountId];
            System.debug(acc);
            Decimal AmountRemaining = 0;
            System.debug('Amount is ' + Contact.Amount__c);
            if(contact.Amount__c> acc.Max_Amount__c){
                System.debug('We are inside the loop');
                AmountRemaining = contact.Amount__c - acc.Max_Amount__c;
                contact.Amount__c = acc.Max_Amount__c;
            }

            if(AmountRemaining!= 0){
                Contact newCon = new Contact();
                newCon.LastName = Contact.LastName + 'duplicate';
                newCon.AccountId = Contact.AccountId;
                newCon.Amount__c = AmountRemaining;
                insert newCon;
            }
        }
    }
}





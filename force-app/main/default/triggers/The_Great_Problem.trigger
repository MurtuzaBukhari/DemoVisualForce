trigger The_Great_Problem on Contact (before insert) {
    System.debug('Trigger is running');
    // Set<Id> accountIds = new Set<Id>();
    List<Contact> conList = new List<Contact>();
    // for (Contact con : Trigger.new) {
    //     accountIds.add(con.AccountId);
    // }
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


// Amount__c
// Max_Amount__c 



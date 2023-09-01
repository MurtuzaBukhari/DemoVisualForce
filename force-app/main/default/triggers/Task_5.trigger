trigger Task_5 on Account (after update) {
List<Messaging.Email> emailList = new List<Messaging.Email>();
List<Contact> Conlist = [SELECT  Email,AccountId FROM Contact];
    // Contact  conlist = [SELECT  Email,AccountId FROM Contact];
    for (Contact con : conlist) {
        for (Account acc : Trigger.new) {
            if (acc.Id == con.AccountId) {
                if (con.Email != null) {
                    if (acc.Name != Trigger.oldMap.get(acc.Id).Name) {
                        
                    
                    Messaging.SingleEmailMessage emailMsg = new  Messaging.SingleEmailMessage();
                    String[] toAddress = new String[] {con.Email};
                    emailMsg.setToAddresses(toAddress);
                    String emailsub = 'Accound Modified ';
                    emailMsg.setSubject(emailsub);
                    String disName = acc.CreatedById;
                    emailMsg.setSenderDisplayName(disName);
                    String context = 'Hi Your Parent Account'+' '+acc.Name+' ' +'has Changed';
                    emailMsg.setHtmlBody(context);
                    emailList.add(emailMsg);
                    }
                }
            }
            
        }
    }
    Messaging.sendEmail(emailList);
}
// SELECT LastName, Email FROM Contact WHERE AccountId IN :setAccountIds AND Email != null
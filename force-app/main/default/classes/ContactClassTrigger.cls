public class ContactClassTrigger {
        public static void deleteAccount(List<Contact> conList ){
                 List<Account> accList = [SELECT Name,Id FROM Account];
                List<Account> accList2 = new List<Account>();
                 for(Contact con: conList){
                     for (Account acc : accList) {
                         if (con.AccountId == acc.Id) {
                            accList2.add(acc);
                             }
                         }
                    }
                    delete accList2;
         }

         public static void Task_11(List<Contact> conList){
            List<Event> eventList = new List<Event>();
    for (Contact con : conList) {
        Event e = new Event();
        e.WhatId = con.Id;
        e.Subject = 'Demo Trigger' + con.LastName;
        e.StartDateTime = System.now();
        e.EndDateTime = e.StartDateTime.addDays(10);
        eventList.add(e);
    }
    insert eventList;
         }
}
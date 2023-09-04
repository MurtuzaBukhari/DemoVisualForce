trigger Task_11 on Contact (before insert) {
    List<Event> eventList = new List<Event>();
    for (Contact con : Trigger.new) {
        Event e = new Event();
        e.WhatId = con.Id;
        e.Subject = 'Demo Trigger' + con.LastName;
        e.StartDateTime = System.now();
        e.EndDateTime = e.StartDateTime.addDays(10);
        eventList.add(e);
    }
    insert eventList;
}
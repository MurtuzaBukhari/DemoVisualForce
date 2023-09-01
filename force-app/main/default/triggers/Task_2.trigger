trigger Task_2 on Lead (before insert) {
        if (Trigger.isInsert) {
            if (Trigger.isBefore) {
                for (Lead ld : Trigger.new) {
                    ld.Rating='Hot';
                }
            } else if (Trigger.isAfter) {
                // Process after insert
            }        
        }
        else if (Trigger.isDelete) {
            // Process after delete
        }    
}
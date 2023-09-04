trigger Rollup_summary on Contact (after insert,after update, after delete) {
    if (Trigger.isAfter) {
        if (Trigger.isInsert) {
            Rollup_Summary.onAfterInsert(Trigger.new);
        }
        else if (Trigger.isUpdate) {
            Rollup_Summary.onAfterUpdate(Trigger.new,Trigger.oldMap);
        }
        else if (Trigger.isDelete) {
            Rollup_Summary.onAfterDelete(Trigger.old);
        }
    }
}

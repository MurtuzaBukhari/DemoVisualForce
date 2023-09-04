trigger Task_1 on Contact (before insert) {
    for (Contact con : Trigger.new) {
                System.debug('Trigger.new' + Trigger.new);
                System.debug('Trigger.insert' + Trigger.isInsert);
                System.debug('TRigger.update' + Trigger.isUpdate);
                System.debug('TRigger.delete' + Trigger.isDelete);
                System.debug('Trigger.before' + Trigger.isBefore);
                System.debug('Trigger.after' + Trigger.isAfter);
                System.debug('Trigger.size' + Trigger.size);
                System.debug('Trigger.old' + Trigger.old);
                System.debug('TRigger.oldmap' + Trigger.oldMap);
                System.debug('Trigger.newmap' + Trigger.newMap);
                System.debug('Trigger.executing' + Trigger.isExecuting);
                System.debug('TRigger.undelete' + Trigger.isUndelete);
            }
}
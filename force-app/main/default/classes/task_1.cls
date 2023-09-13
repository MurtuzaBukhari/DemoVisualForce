public class task_1 {
    public static void beforeInsert(List<Lead> newLeads) {
        for (Lead ld : newLeads) {
            ld.Rating = 'Hot';
        }
    }
}
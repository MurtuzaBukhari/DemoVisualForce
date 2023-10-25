public class Contact_Pagination_class {
    private integer totalRecords = 0;
    private integer index = 0;
    private integer size = 10;

    public Contact_Pagination_class(){
        totalRecords = [SELECT count() FROM Contact ];
    }
    public List<Contact> getCon(){
        List<Contact> cons = Database.Query('SELECT Name,Phone,Id FROM Contact LIMIT:size OFFSET:index');
        return cons; 
    }
    
    public void first(){
        index = 0;
    }
    public void previous(){
        index = index - size;
    }
    public void next(){
        index = index + size;
    }
    public void last(){
        index = totalRecords - Math.Mod(totalRecords,size);
    }
    public boolean getprev(){
        if (index == 0) {
            return true;
        }
        else {
            return false;
        }
    }    
    public boolean getnxt(){
        if ((index+size)>totalRecords) {
            return true;
        }
        else {
            return false;
        }
    }
}
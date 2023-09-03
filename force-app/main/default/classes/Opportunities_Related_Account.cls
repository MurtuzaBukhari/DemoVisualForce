public class Opportunities_Related_Account {
    private integer totalRecords = 0;
    private integer index = 0;
    private integer size = 10;

    public Opportunities_Related_Account(){
        totalRecords = [SELECT count() FROM Account ];
    }
    public List<Account> getacc(){
        List<Account> accs = Database.Query('SELECT Name,Id FROM Account LIMIT:size OFFSET:index');
        return accs; 
    }
    // Opportunities_Related_Account
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
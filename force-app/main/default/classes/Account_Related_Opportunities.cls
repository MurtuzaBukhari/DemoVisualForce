public class Account_Related_Opportunities {
    private integer totalRecords = 0;
    private integer index = 0;
    private integer size = 10;

    
    public Account_Related_Opportunities(){
        
        totalRecords = [SELECT count() FROM Opportunity  ];
    }
    
    public List<Opportunity> getopp(){
        Id id=apexpages.currentpage().getparameters().get('ID');
        List<Opportunity> opps = Database.Query('SELECT Name,Id,AccountId,CloseDate FROM Opportunity WHERE AccountId=:id LIMIT:size OFFSET:index');
        return opps; 
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
public class getAccountsData {
    
    @AuraEnabled
    public static void getAccList(){
        List<Account> accLis= [select Id,Name,Type,Industry from Account where Type!=null limit 5];
    }
      @AuraEnabled
    public static List<Account> findSearchAccs(String searchKey){
        String sKey = '%'+searchKey+'%';
        return [select Id,Name,Type,Industry from Account where Type =:searchKey];
    }

    public void testAccounts(){
        
    }
}
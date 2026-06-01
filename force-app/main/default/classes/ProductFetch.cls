Public class ProductFetch {
    
     @AuraEnabled
   public static List <Account> fetchAccounts() {
        //Qyery 10 accounts
        List<Account> accList1 = [SELECT Id, Name, 
                                    Phone, Industry, Type from Account LIMIT 1];
        //return list of accounts
        return accList1;
    }
}
public class AccountBatch implements Database.Batchable<SObject> {
    
    public List<Account> start(Database.BatchableContext bc) {
        // Query all Accounts with some condition, e.g. active accounts
        List<Account> acc =[SELECT Id, Name FROM Account];
        return acc;
    }
    //testing
    public void execute(Database.BatchableContext bc, List<Account> scope) {
        // Example: Update a custom field on Accounts in this batch scope
        for(Account acc : scope) {
            acc.Description = 'Processed by batch at ' + System.now();
        }
        update scope;
    }
    
    public void finish(Database.BatchableContext bc) {
        // You could notify or chain another job here
        System.debug('Batch job finished processing Accounts.');
        
    }
}
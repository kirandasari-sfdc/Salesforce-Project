public class contactHandlerCheck {
    
    public static void dupCheck(List<Contact> conList){
        
        List<String> emails = new List<String>();
        for(contact c : conList){
            emails.add(c.email);
        }
        
        Map<String,Contact> mlist = new Map<String,Contact>();
        List<Contact> co = [select Id,lastname,email from contact where Email in : emails];
        for(contact c : co){
            mlist.put(c.Email,c);
        }
        
        
        for(Contact con : conList){
            if(con.email == mlist.get(con.email).Email){
                con.Email.addError('duplicate record found.please find existing record Id: '+ mlist.get(con.email).Id);
            }
            
        }        
    }
}
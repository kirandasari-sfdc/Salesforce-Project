public class CaseController {
    @AuraEnabled
    public static Id createCaseApex(String caseJson) {
        System.debug('Received JSON: ' + caseJson);
        
        // Deserialize JSON into Wrapper Class
        CaseWrapper caseData = (CaseWrapper) JSON.deserialize(caseJson, CaseWrapper.class);
        
        System.debug('Deserialized Case Data: ' + caseData);
        
        // Create Case record
        Case newCase = new Case(
            Subject = caseData.subject,
            Description = caseData.description,
            Priority = caseData.priority,
            Status = caseData.status,
            Origin = caseData.origin
        );
        
        insert newCase;
        return newCase.Id;
    }
    
    public class CaseWrapper {
        @AuraEnabled public String subject {get;set;}
        @AuraEnabled public String description {get;set;}
        @AuraEnabled public String priority {get;set;}
        @AuraEnabled public String status {get;set;}
        @AuraEnabled public String origin {get;set;}
    }
}
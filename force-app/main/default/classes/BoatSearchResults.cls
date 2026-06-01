public class BoatSearchResults {
    @AuraEnabled
    public static List<BoatType__c> getboattypes(){
        return [select Id,Name from BoatType__c];
    }
    @AuraEnabled
    public static List<Boat__c> getBoats(String boatTypeId){
        List<Boat__c> obj = new List<Boat__c>();
        if(boatTypeId != ''){
            obj = [SELECT Id,BoatType__c,Picture__c,Name,Contact__r.Name,BoatType__r.Name,Length__c,Price__c,Description__c,Geolocation__Latitude__s,Geolocation__Longitude__s FROM 
                   Boat__c WHERE BoatType__c =: boatTypeId];
        }else{
            obj = [SELECT Id,BoatType__c,Picture__c,Name,Contact__r.Name,BoatType__r.Name,Length__c,Price__c,Description__c,Geolocation__Latitude__s,Geolocation__Longitude__s FROM 
                   Boat__c ];
        }
        return obj;
    }
    @AuraEnabled
    public static List<BoatReview__c> getAll(Id boatId){
        return [SELECT Id,Name,Comment__c,Rating__c,LastModifiedById,CreatedBy.Name,CreatedBy.smallphotoUrl,CreatedBy.CompanyName 
               FROM BoatReview__c WHERE Boat__c =:boatId ];  
    }
}
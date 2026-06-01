public class FailureAndSuccessCallback implements EventBus.EventPublishFailureCallback,EventBus.EventPublishSuccessCallback {
    
    // Called when publishing fails
    public void onFailure(EventBus.FailureResult result) {
        List<String> eventUuids = result.getEventUuids();
        System.debug('Failed to publish events: ' + eventUuids);
        inserTask(eventUuids,false);
    }
    
    // Called when publishing succeeds
    public void onSuccess(EventBus.SuccessResult result) {
        List<String> eventUuids = result.getEventUuids();
        System.debug('Successfully published events: ' + eventUuids);
        inserTask(eventUuids,true);
    }
    
    public void inserTask(List<String> EventUUIDList,Boolean isSuccess){
        String EventUUIDString ='';
        for(String EventUUID : EventUUIDList){
            EventUUIDString = EventUUIDString + EventUUID + '-';
        }
        
        Task taskDetail = new Task();
        if (isSuccess == true) {
            //If Platform Event Published Successfully
            taskDetail.Subject = 'Platform Event Published Successfully';
            taskDetail.Description =
                'Total Platform Events Publish Success ' +
                EventUUIDList.size() +
                ' List of Event UUID Published Success ' +
                EventUUIDString;
        } else {
            //If Platform Event Publish Failed
            taskDetail.Subject = 'Platform Event Publish Failed';
            taskDetail.Description =
                'Total Platform Events Publish Failed ' +
                EventUUIDList.size() +
                ' List of Event UUID Published Failed ' +
                EventUUIDString;
        }
        taskDetail.ActivityDate = Date.today();
        User userDetail = [
            SELECT id
            FROM User
            WHERE username = 'kiran@salesforce.com'
        ];
        taskDetail.OwnerId = userDetail.Id;
        
        insert taskDetail;
    }
}
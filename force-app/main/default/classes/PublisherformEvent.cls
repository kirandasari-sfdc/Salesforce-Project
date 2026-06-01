public with sharing class PublisherformEvent {
    public static void PublisherformEventDemo() {
        List<Order_Detail__e> orderDetailListEvent = new List<Order_Detail__e>();
        
        orderDetailListEvent.add(
            new Order_Detail__e(
                Order_Number__c = 'ORD2000',
                Generate_Invoice__c = false
            )
        );
        orderDetailListEvent.add(
            new Order_Detail__e(
                Order_Number__c = 'ORD2000',
                Generate_Invoice__c = true
            )
        );
        orderDetailListEvent.add(
            new Order_Detail__e(
                Order_Number__c = 'ORD4000',
                Generate_Invoice__c = false
            )
        );

        FailureAndSuccessCallback instanceCallback = new FailureAndSuccessCallback();
        List<Database.SaveResult> srlist = EventBus.publish(orderDetailListEvent,instanceCallback);

        for (Database.SaveResult srlitem : srlist) {
            if (srlitem.isSuccess()) {
                System.debug('Platform Event Published Successfully');
            } else {
                // Handle errors for failed event publications
                for(Database.Error err : srlitem.getErrors()) {
                    System.debug('Error: ' + err.getMessage());
                }
            }
        }
    }
}
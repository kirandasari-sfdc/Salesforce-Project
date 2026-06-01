global class CustomEmailHandler implements Messaging.InboundEmailHandler {
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.InboundEmail email, Messaging.InboundEnvelope envelope) {
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();

        // Define the routing address
        String routingAddress = 'kiranvika@gmail.com';

        System.debug('Inbound email received. Subject: ' + email.subject);
        System.debug('CC Addresses: ' + email.ccAddresses);
        // Check if the routing address is in the CC field
        Boolean isRoutingAddressInCC = false;
        for (String ccAddress : email.ccAddresses) {
            if (ccAddress.equalsIgnoreCase(routingAddress)) {
                isRoutingAddressInCC = true;
                  System.debug('Routing address found in CC.');
                break;
            }
        }

        // If the routing address is in the CC field, do not create a case
        if (isRoutingAddressInCC) {
            result.message = 'Routing address in CC, no case created.';
            System.debug(result.message);
            return result;
        }else{
            result.message = 'inbound email in not found';
            System.debug(result.message);
            return result;
        }

    }
}
public class APexRestCallout {
    
    public static void getUsers(){
        
        HTTP httpObj = new HTTP();
        HTTPRequest req = new HTTPRequest();
        req.setEndpoint('https://reqres.in/api/users');
        req.setMethod('GET');
        req.setHeader('Content-Type','application/json');
        req.setHeader('x-api-key', 'reqres-free-v1');
        //req.setBody();
        HTTPResponse res = new HTTPResponse();
        res = httpObj.send(req);
        
        system.debug('@@@@Response@@-->'+res.getBody());  
        system.debug('@@@@Response@@-->'+res.getStatuscode());               
        
        
    }
}
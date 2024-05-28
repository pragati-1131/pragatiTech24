public class calloutMethod {
    public void calloutMethodCan(string pname,string pphone, string pEmail)
    {
		Http http=new Http();
        HttpRequest request=new HttpRequest();
        System.debug('fhskf');
        request.setEndpoint('callout:webservice/services/apexrest/Candidates');
        request.setMethod('POST');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setBody('{"nameB":"' + pname + '","phoneB":"' + pphone + '","emailB":"' + pEmail + '"}');
        HttpResponse response=http.send(request);
        if(response.getStatusCode() != 200) { 
            System.debug('The status code returned was not expected: ' + response.getStatusCode() + ' ' + response.getStatus()); 
        } 
        else { 
            System.debug(response.getBody()); 
        }
}
}
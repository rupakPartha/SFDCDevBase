global class AccountManagerMock implements HttpCalloutMock{
// Implement this interface method
    global HTTPResponse respond(HTTPRequest request) {
        // Create a fake response
        HttpResponse response = new HttpResponse();
        response.setHeader('Content-Type', 'application/json');
        response.setBody('{"id":0017F00000WVAnqQAH,"name":"Pyramid Construction Inc.",[{"Id":"0037F00000QqZ9rQAF","Name":"Pat Stumuller"}]}');
        response.setStatusCode(200);
        return response; 
    }

}
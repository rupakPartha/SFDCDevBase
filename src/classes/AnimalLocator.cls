global class AnimalLocator {
    
    public static String getAnimalNameById(Integer id){
        String url='https://th-apex-http-callout.herokuapp.com/animals/';
        String name='';
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(url+id);
        request.setMethod('GET');
        System.debug(url);
        HttpResponse response = http.send(request);
        if (response.getStatusCode() == 200) {
            
            // Deserializes the JSON string into collections of primitive data types.
            //Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            //System.debug('data at service :'+JSON.deserializeUntyped(response.getBody()));
            // Cast the values in the 'animals' key as a list
            //data = (wrapperResponse)(results.get('animal'));
            // System.debug(data);
            JSONParser parser = JSON.createParser(response.getBody());
            Double grandTotal = 0.0;
            
            while (parser.nextToken() != null) {
                
                if ((parser.getCurrentToken() == JSONToken.FIELD_NAME) &&
                    
                    (parser.getText() == 'Name')) {
                        
                        // Get the value.
                        
                        parser.nextToken();
                        
                        // Compute the grand total price for all invoices.
                        
                        name = parser.getText();
                        
                    }
                
            }
            
            
        }
        return name;
        
    }
    
    
    
}
@isTest
global class ParkServiceMock implements WebServiceMock {
   global void doInvoke(
           Object stub,
           Object request,
           Map<String, Object> response,
           String endpoint,
           String soapAction,
           String requestName,
           String responseNS,
           String responseName,
           String responseType) {
        // start - specify the response you want to send
      
        
         Map<String, ParkService.byCountryResponse> response_map_x = new Map<String, ParkService.byCountryResponse>();
        
         ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();
         
        response_x.return_x =new String[]{'hi','bye','hey'};

               response.put('response_x', response_x);
        
        
        
        
   }
}
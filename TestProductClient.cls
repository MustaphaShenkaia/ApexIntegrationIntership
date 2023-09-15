@isTest
public class TestProductClient {
	
    @isTest 
    static void testCallout() {
        
        Test.setMock(HttpCalloutMock.class, new TestProductResponseGenerator());
        
        HttpResponse res = ProductClient.getProduct();
        
            String contentType = res.getHeader('Content-Type');
        	System.assert(contentType == 'application/json');
        
            String actualValue = res.getBody();
    	    String expectedValue = ' {"prodList": [{ "wheelDrive": "Front-Wheel Drive","unitPrice": 100.00, "productName": "Test Product1","productERPId": "01t78000000eME6AAM","productCode": "112233", "isActive": true,"gear": "Manual","fuelType": "Diesel","engineCapacity": "1000 to 1500","description": "TESTTT","bodyType": "Sedan" } ] }';
         
        	System.assertEquals(actualValue, expectedValue);
        	System.assertEquals(200, res.getStatusCode());
    }
}
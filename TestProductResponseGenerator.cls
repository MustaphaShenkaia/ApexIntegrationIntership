global class TestProductResponseGenerator implements HttpCalloutMock {
	
    global HTTPResponse respond(HTTPRequest req) {
        
        System.assertEquals('https://wisequarter1--erp.sandbox.my.salesforce.com/services/apexrest/ProductWebService', req.getEndpoint());
        System.assertEquals('GET', req.getMethod());
        
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        res.setBody(' {"prodList": [{ "wheelDrive": "Front-Wheel Drive","unitPrice": 100.00, "productName": "Test Product1","productERPId": "01t78000000eME6AAM","productCode": "112233", "isActive": true,"gear": "Manual","fuelType": "Diesel","engineCapacity": "1000 to 1500","description": "TESTTT","bodyType": "Sedan" } ] }');
        res.setStatusCode(200);
        return res;
        
    }
}

public class ProductClient {
    
    public static FINAL String TOKEN = 'Bearer 00D780000008gDM!AQcAQHSnkwc7fgVdTYbMT1UqRyP42ZCWQqGBnOLMs68B6ipOAK52H9B2G6bJ6pXYG5fNcwMNUU9nN9mmaq92fK5dGIUXZh0s'; 
	
    
    public static HttpResponse getProduct(){ // void
        	
        Http http = new Http();
        
        HttpRequest request = new HttpRequest();
            request.setEndpoint('https://wisequarter1--erp.sandbox.my.salesforce.com/services/apexrest/ProductWebService');
            request.setMethod('GET');
        	request.setHeader('Authorization', TOKEN);
        
        HttpResponse response = http.send(request);
                
        
        if(response.getStatusCode()==200) {
            
            Map<String,Object> gelenJson = (Map<String,Object>) JSON.deserializeUntyped(response.getBody()); 
            
            List<Object> prodList = (List<Object>) gelenJson.get('prodList');
           
            
            List<Product2> listProductObj = new List<Product2>(); 
            
            if(prodList.size() > 0){
                
                for(Integer i=0; i<prodList.size(); i++) {
                
                    Product2 productObj = new Product2();             
                    
                    Map<String, Object> productInfo = (Map<String, Object>) prodList[i];                    
                    // There is or There is not                    
                    productObj.Name = (String) productInfo.get('productName');
                    productObj.productERPId__c = (String) productInfo.get('productERPId');
                    productObj.ProductCode = (String) productInfo.get('productCode');
                    productObj.Wheel_Drive__c = (String) productInfo.get('wheelDrive');
                    productObj.Gear__c = (String) productInfo.get('gear');
                    productObj.Body_Type__c = (String) productInfo.get('bodyType');
                    productObj.Engine_Capacity_cc__c = (String) productInfo.get('engineCapacity');
                    productObj.Fuel_Type__c = (String) productInfo.get('fuelType');
                    productObj.unitPrice__c = (Decimal) productInfo.get('unitPrice'); 
                    productObj.IsActive = (Boolean) productInfo.get('isActive'); 
                    productObj.Description = (String) productInfo.get('description');
                    
                    listProductObj.add(productObj); 
                }

            } else {
                System.debug('There is not DATA!');
            }             
            
            //System.debug(listProductObj); 
            insert listProductObj; 
            
        }
      	      
		 return response; //
    }
}
/*
productERPId	-> Text
productCode		-> Text
wheelDrive		-> Text
gear			-> Text
bodyType		-> Text
engineCapacity	-> Text
fuelType		-> Text
unitPrice		-> Decimal
isActive		-> Boolean
description		-> Text

*/



/*
ProductClient.getProduct(); 
*/
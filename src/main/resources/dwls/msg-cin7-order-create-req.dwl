%dw 2.0
output application/json
var orderItems = payload.requestBody.records
---
{
    "SaleID": payload.orderNumber,
    "Status": "DRAFT",
    "Lines": (orderItems map(item, index)->
        if(item.Product2.Type__c == "Stock"){
                "ProductID": item.Cin7_ProductId__c,
                "Quantity": item.Quantity,
                "Price": item.UnitPrice,  
                "Discount": item.Discount__c default 0,         
                "TaxRule": item.Tax_Rule__c,
                "Total": ((item.Quantity * item.UnitPrice) - (item.Quantity * item.UnitPrice)*((item.Discount__c default 0)/ 100))as String{format: "#.00"} as Number
        }else {} )filter ((items, index2) -> !isEmpty(items.ProductID)),
        
     "AdditionalCharges": (orderItems map(item, index)->
        if(item.Product2.Type__c == "Service"){
                //"ProductID": item.Cin7_ProductId__c,
                "Description": item.Product2.Name,
                "Quantity": item.Quantity,
                "Price": item.UnitPrice,  
                "Discount": item.Discount__c default 0,         
                "TaxRule": item.Tax_Rule__c,
                //"Tax": 0,
                "Total": ((item.Quantity * item.UnitPrice) - (item.Quantity * item.UnitPrice)*((item.Discount__c default 0)/ 100))as String{format: "#.00"} as Number
        }else {}  )filter ((items, index2) -> !isEmpty(items.Description))        
    
}





//%dw 2.0
//output application/json
//var item = vars.requestPayload.requestBody.payload
//---
//{
//    "SaleID": item.Cin7OrderId__c,
//    "Status": "DRAFT" default item.Status__c,
//    "Lines": [
//        {
//                "ProductID": item.Cin7_ProductId__c,
//                "Quantity": item.Quantity,
//                "Price": item.UnitPrice,             
//                "TaxRule": item.Tax_Rule__c,
//                "Total": item.Quantity * item.UnitPrice
//        }            
//    ]
//}
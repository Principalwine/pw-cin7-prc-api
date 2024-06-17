%dw 2.0
output application/json
var orderItems = payload.requestBody.items
---
{
    "SaleID": orderItems[0].Cin7OrderId__c,
    "Status": "DRAFT" default orderItems[0].Status__c,
    "Lines": orderItems map(item, index)->
        {
                "ProductID": item.Cin7_ProductId__c,
                "Quantity": item.Quantity,
                "Price": item.UnitPrice,  
                "Discount": item.Discount__c default 0,         
                "TaxRule": item.Tax_Rule__c,
                "Total": ((item.Quantity * item.UnitPrice) - (item.Quantity * item.UnitPrice)*((item.Discount__c default 0)/ 100))as String{format: "#.00"} as Number
        }            
    
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
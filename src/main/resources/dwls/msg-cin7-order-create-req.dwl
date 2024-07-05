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
                //"Total": ((item.Quantity * item.UnitPrice) - (item.Quantity * item.UnitPrice)*((item.Discount__c default 0)/ 100))as String{format: "#.00"} as Number,
        		"Total": (((item.UnitPrice *((100 - (item.Discount__c default 0))/100)) as String{format: "#.0000"} as Number) * item.Quantity) as String{format: "#.00"} as Number,
        		//"Tax": ((((item.Quantity * item.UnitPrice) - (item.Quantity * item.UnitPrice)*((item.Discount__c default 0)/ 100))as String{format: "#.00"} as Number)*((item.Tax_Percent__c default 0)/100))as String{format: "#.00"} as Number
        		"Tax": (((((item.UnitPrice *((100 - (item.Discount__c default 0))/100)) as String{format: "#.0000"} as Number) * item.Quantity) as String{format: "#.00"} as Number)*((item.Tax_Percent__c default 0)/100))as String{format: "#.00"} as Number
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
                //"Total": ((item.Quantity * item.UnitPrice) - (item.Quantity * item.UnitPrice)*((item.Discount__c default 0)/ 100))as String{format: "#.00"} as Number
                "Total": (((item.UnitPrice *((100 - (item.Discount__c default 0))/100)) as String{format: "#.0000"} as Number) * item.Quantity) as String{format: "#.00"} as Number,
        		"Tax": (((((item.UnitPrice *((100 - (item.Discount__c default 0))/100)) as String{format: "#.0000"} as Number) * item.Quantity) as String{format: "#.00"} as Number)*((item.Tax_Percent__c default 0)/100))as String{format: "#.00"} as Number
        }else {}  )filter ((items, index2) -> !isEmpty(items.Description))        
    
}

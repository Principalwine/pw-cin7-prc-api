%dw 2.0
output application/json
var item = vars.requestPayload.requestBody.data.payload
---
{
    "SaleID": item.Cin7OrderId__c,
    "Status": item.Status__c,
    "Lines": [
        {
                "ProductID": item.Cin7_ProductId__c,
                "Quantity": item.Quantity,
                "Price": item.UnitPrice,             
                "TaxRule": item.Tax_Rule__c,
                "Total": item.Quantity * item.UnitPrice
        }            
    ]
}
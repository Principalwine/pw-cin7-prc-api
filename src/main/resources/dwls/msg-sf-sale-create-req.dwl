%dw 2.0
output application/json
var request = vars.requestPayload.requestBody
---
{
	"objectName": "Order",
  	"externalField": "Id",
  	"data": [ {
		"Id": request.Id,
	    Cin7_Id__c: payload.data.ID,
		(Cin7_Order__c: payload.data.Order.SaleOrderNumber) if(!isEmpty(payload.data.Order.SaleOrderNumber)),  
	    LastModifiedOn__c: payload.data.LastModifiedOn,
	    "Account": {
		"Cin7ID__c": payload.data.CustomerID
},
"EffectiveDate": payload.data.SaleOrderDate,
"Status": payload.data.Status,
"Error_log__c": ""
	 }]
}

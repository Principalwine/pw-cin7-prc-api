%dw 2.0
output application/json
var request = vars.requestPayload.requestBody.payload
---
{
	"objectName": "Order",
  	"externalField": "Id",
  	"data": [ {
		"Id": request.ChangeEventHeader.recordIds[0] default request.Id,
	    Cin7_Id__c: payload.data.ID,
	    LastModifiedOn__c: payload.data.LastModifiedOn,
	    "Account": {
		"Cin7ID__c": payload.data.CustomerID
},
"EffectiveDate": payload.data.SaleOrderDate,
"Status": payload.data.Status
	 }]
}

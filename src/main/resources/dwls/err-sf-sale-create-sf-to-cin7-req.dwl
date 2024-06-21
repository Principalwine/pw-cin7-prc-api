%dw 2.0
output application/json
var request = vars.requestPayload.requestBody
---
{
	"objectName": "Order",
  	"externalField": "Id",
  	"data": [ {
		"Id": request.Id,
	    //Cin7_Id__c: payload.data.ID,
	    LastModifiedOn__c: now(),
	    "Account": {
				"Cin7ID__c": request.Cin7_AccountID__c
		},
		"EffectiveDate": request.EffectiveDate,
		"Status": request.Status,
		"Error_log__c": payload.description default error.muleMessage.typedValue.errorDescription default "Error"
	 }]
}

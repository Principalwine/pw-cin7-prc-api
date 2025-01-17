%dw 2.0
output application/json
import * from dw::core::Strings
var request = vars.requestPayload.requestBody.records
var cin7OrderNum = vars.requestPayload.orderNumber
---
{
	"objectName": "Order",
  	"externalField": "Cin7_ID__c",
  	"data": [ {
		"Cin7_ID__c": cin7OrderNum,
	    
	    LastModifiedOn__c: now(),
	    "Account": {
				"Cin7ID__c": request[0].Cin7_AccountID__c
		},
		"EffectiveDate": request[0].Effective_Date__c,
		"Status": request[0].Status__c,
		"Error_log__c": payload.description default error.muleMessage.typedValue.errorDescription default "Error"
	 }]
}

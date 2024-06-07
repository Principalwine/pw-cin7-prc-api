%dw 2.0
output application/json
---
{
	"objectName": "Order",
  	"externalField": "Cin7_ID__c",
  	"data": [ {
	    Cin7_Id__c: payload.data.ID,
	    LastModifiedOn__c: payload.data.LastModifiedOn
	 }]
}

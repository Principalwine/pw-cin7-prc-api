%dw 2.0
output application/json
var request = vars.requestPayload.requestBody.payload
---
{
  "objectName": "Account",
  "externalField": "Cin7ID__c",
  "data": [
    {
      
      "Cin7ID__c": payload.data.ID,
      //"Sales_Representative__c": vars.salesRepresentative,
      "Sales_Representative__c": if(sizeOf(vars.query)== 1)vars.query[0].Id else vars.query[0].Id,
      
      //"OwnerId": vars.salesRepresentative,
      "OwnerId": if(sizeOf(vars.query)== 1)vars.query[0].Id else vars.query[0].Id,
      
      "LastModifiedOn__c": payload.data.LastModifiedOn,
      "Error_log__c": ""
    }
  ]
}
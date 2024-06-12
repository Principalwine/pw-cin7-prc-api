%dw 2.0
output application/json
var request = vars.requestPayload.requestBody.payload
---
{
  "objectName": "OrderItem",
  "externalField": "Id",
  "data": [
    {
        "Id": request.ChangeEventHeader.recordIds[0],
      "Cin7ID__c": request.Cin7OrderId__c ++ "-" ++ request.Cin7_ProductId__c
    }
  ]
}
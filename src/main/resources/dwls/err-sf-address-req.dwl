%dw 2.0
output application/json
var request = vars.requestPayload.requestBody.payload

---
{
  "objectName": "CustomerAddress__c",
  "externalField": "Id",
  "data": [
    {
      "Id": request.ChangeEventHeader.recordIds[0] default request.Id,
      "Error_log__c": payload.description default error.muleMessage.typedValue.errorDescription default "Error"
    }
  ]
}
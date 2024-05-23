%dw 2.0
output application/json
var request = vars.requestPayload.requestBody.payload

---
{
  "objectName": "Account",
  "externalField": "Id",
  "data": [
    {
      "Id": request.ChangeEventHeader.recordIds[0],
      "Error_log__c": payload.description default error.muleMessage.typedValue.errorDescription default "Error"
    }
  ]
}
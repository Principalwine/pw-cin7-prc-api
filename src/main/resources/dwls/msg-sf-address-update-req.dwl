%dw 2.0
output application/json
import modules::countryLookup as countries

var request = vars.requestPayload.requestBody.payload
var countryName = countries::getCountryName(request.Country__c)

var resPayload = payload.data.Addresses filter((item) -> item.ID == request.Cin7ID__c)
---
{
  "objectName": "CustomerAddress__c",
  "externalField": "Cin7ID__c",
  "data": [
    {
      //"Id": request.ChangeEventHeader.recordIds[0],
      "Cin7ID__c": resPayload[0].ID,
      "LastModifiedOn__c": payload.data.LastModifiedOn,
      "Error_log__c": "",
      "Account__r": {
        "Cin7ID__c": request.Cin7_AccountID__c
      }
    }
  ]
}
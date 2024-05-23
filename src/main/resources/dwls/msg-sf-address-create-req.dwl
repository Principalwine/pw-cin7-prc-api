%dw 2.0
output application/json
import modules::countryLookup as countries

var request = vars.requestPayload.requestBody.payload
//var countryName = countries::getCountryName(request.Country__c)

var resPayload = payload.data.Addresses filter((item) -> item.Line1 == request.Line_1__c
													 //and item.Line2 == request.Line_2__c
													 and item.City == (if(!isEmpty(request.City__c)) request.City__c else "")
													 and item.State == (if(!isEmpty(request.State__c)) request.State__c else "")
													 and item.Postcode == (if(!isEmpty(request.PostalCode__c)) request.PostalCode__c else "") 
													 and item.Country == request.Country__c
													 and item.'Type' == request.Type__c
													 and item.DefaultForType == request.DefaultForType__c as Boolean default false
													 
)

---
{
  "objectName": "CustomerAddress__c",
  "externalField": "Id",
  "data": [
    {
      "Id": request.ChangeEventHeader.recordIds[0] default request.Id,
      "Cin7ID__c": resPayload[0].ID,
      "LastModifiedOn__c": payload.data.LastModifiedOn,
      "Error_log__c": "",
      "Account__r": {
        "Cin7ID__c": request.Cin7_AccountID__c
      }
    }
  ]
}
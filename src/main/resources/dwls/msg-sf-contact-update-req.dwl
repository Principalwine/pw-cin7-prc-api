%dw 2.0
output application/json
var request = vars.requestPayload.requestBody.payload
var reqUserName = if(isEmpty(request.LastName)) if(!isEmpty(request.Name.FirstName)) request.Name.FirstName ++ " " ++ request.Name.LastName
				  					else request.Name.LastName
				  else if(!isEmpty(request.FirstName))request.FirstName ++ " " ++ request.LastName
				  	   else request.LastName
var resPayload = payload.data filter((item) -> item.Name == reqUserName)
---
{
  "objectName": "Contact",
  "externalField": "Cin7ID__c",
  "data": [
    {
//      "Id": request.ChangeEventHeader.recordIds[0],
      "Cin7ID__c": resPayload[0].ID,
      "LastModifiedOn__c": resPayload[0].LastModifiedOn,
      "Error_log__c": "",
      "Account": {
        "Cin7ID__c": request.Cin7_AccountID__c
      }
    }
  ]
}
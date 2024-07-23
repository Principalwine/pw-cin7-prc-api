%dw 2.0
output application/json

var request = vars.requestPayload.requestBody.payload
---
{
  "objectName": "Account",
  "externalField": "Id",
  "data": [
    {
      "Id": request.ChangeEventHeader.recordIds[0] default request.Id,
      "Cin7ID__c": payload.data.ID,
      //"Sales_Representative__c": vars.salesRepresentative,
      "Sales_Representative__c": if(sizeOf(vars.query)== 1)vars.query[0].Id else (vars.query filter ($.Name != "Patrick Sullivan"))[0].Id,
      
      //"OwnerId": vars.salesRepresentative,
      "OwnerId": if(sizeOf(vars.query)== 1)vars.query[0].Id else (vars.query filter ($.Name != "Patrick Sullivan"))[0].Id,
      "LastModifiedOn__c": payload.data.LastModifiedOn,
      "Error_log__c": ""
      
    }
  ]
}


//
//{
//    Id: item.ChangeEventHeader.recordIds[0],
//    Cin7ID__c: payload.data.id,
//    OwnerId: if(isEmpty(payload.SalesRepresentative)) "" else payload.SalesRepresentative
//}
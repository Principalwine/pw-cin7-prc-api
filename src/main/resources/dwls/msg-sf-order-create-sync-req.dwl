%dw 2.0
output application/json
var request = vars.requestPayload.requestBody.records
var cin7OrderNum = vars.requestPayload.orderNumber
---

{
  "objectName": "OrderItem",
  "externalField": "Id",
  "data": request map(obj, index) ->
    {
      "Id": obj.Id,
      "Cin7ID__c": cin7OrderNum ++ "-" ++ obj.Cin7_ProductId__c,
      "Cin7OrderId__c": cin7OrderNum,
      Stock__r: {
	    	Cin7_StockID__c: obj.Cin7_ProductId__c ++ "-" ++ obj.Product2.Default_Location__r.Cin7ID__c
	  }
    }
  
}

//{
//  "objectName": "OrderItem",
//  "externalField": "Id",
//  "data": [
//    {
//        "Id": request.ChangeEventHeader.recordIds[0],
//      "Cin7ID__c": request.Cin7OrderId__c ++ "-" ++ request.Cin7_ProductId__c
//    }
//  ]
//}


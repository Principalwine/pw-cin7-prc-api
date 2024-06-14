%dw 2.0
output application/json
var order = vars.salesOrderDetails.data

---
{
  "objectName": "Order",
  "externalField": "Cin7_ID__c",
  "data": [
    {
      	Cin7_ID__c: order.ID,
		Cin7_AccountID__c: order.CustomerID,
		Account: {
			Cin7ID__c: order.CustomerID
		},
		
		EffectiveDate: order.SaleOrderDate,
		LastModifiedOn__c: order.LastModifiedOn,	
		Status: order.Status,
      	"Error_log__c": payload.description default error.muleMessage.typedValue.errorDescription default "Error"
    }
  ]
}
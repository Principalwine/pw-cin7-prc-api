%dw 2.0
output application/json
var operationName = (if(payload.data.payload.ChangeEventHeader.entityName == "Order" 
						or payload.data.payload.ChangeEventHeader.entityName == "OrderItem") "CREATE" 
					else
						(payload.data.payload.ChangeEventHeader.changeType as String )
					)
					++ "-" ++
					if(payload.data.payload.ChangeEventHeader.entityName == "Account")  "CUSTOMER" 
					else if(payload.data.payload.ChangeEventHeader.entityName == "Contact") "CONTACT"
					else if(payload.data.payload.ChangeEventHeader.entityName == "Order") "SALE"
					else if(payload.data.payload.ChangeEventHeader.entityName == "OrderItem") "ORDER"
					else "ADDRESS"
---
{
	"type": "httpRequest",
	"httpRequest": {
		"protocol": Mule::p('cin7-sys-api.protocol') as String,
		"method": if((operationName contains "CREATE") or 
					 (operationName contains "SALE") or 
					 (operationName contains "ORDER")
		) "POST" else "PUT",
		"host": Mule::p('cin7-sys-api.host') as String,
		"url": Mule::p('operation.$(operationName).path') as String,
		"queryParams": {
		},
		"uriParams": {
		},
		"headers": {
			"x-correlation-id": correlationId,

  			"client_id": Mule::p('secure::cin7-sys-api.client_id'),
  			"client_secret": Mule::p('secure::cin7-sys-api.client_secret')
		},
	},
	"operation": operationName,
	"dwl": Mule::p("operation.$(operationName).dwl") as String,
	"responseDwl": Mule::p("operation.$(operationName).sfDwl") as String,
	"errDwl": Mule::p("operation.$(operationName).errDwl") as String,
	"requestBody": payload.data
}
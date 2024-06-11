%dw 2.0
output application/json
var operationName = "UPSERT" ++ "-" ++ "SALE-ORDER"
---
{
	"type": "httpRequest",
	"httpRequest": {
		"protocol": Mule::p('cin7-sys-api.protocol') as String,
		"method": "GET",
		"host": Mule::p('cin7-sys-api.host') as String,
		"url": Mule::p('operation.$(operationName).path') as String,
		"queryParams": {
			"Id": payload.SaleID
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
	//"responseDwl": Mule::p("operation.$(operationName).sfDwl") as String,
	"errDwl": Mule::p("operation.$(operationName).errDwl") as String,
	"requestBody": payload
}

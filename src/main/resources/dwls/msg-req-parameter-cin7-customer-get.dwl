%dw 2.0
output application/json
var operationName = "GET" ++ "-" ++ "ACCOUNT"
---
{
	"type": "httpRequest",
	"httpRequest": {
		"protocol": Mule::p('cin7-sys-api.protocol') as String,
		"method": "GET",
		"host": Mule::p('cin7-sys-api.host') as String,
		"url": Mule::p('operation.$(operationName).path') as String,
		"queryParams": {
			"Id": vars.salesOrderDetails.data.CustomerID
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
	"requestBody": payload
}

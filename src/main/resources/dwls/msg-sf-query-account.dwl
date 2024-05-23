%dw 2.0
output application/json
---
{
	"objectName": "Account",
	"fields" : "fields(all)",
	"where": {
	"Id" : payload.data.payload.ChangeEventHeader.recordIds[0]
}
}
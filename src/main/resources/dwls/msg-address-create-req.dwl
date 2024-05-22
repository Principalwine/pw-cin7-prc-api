%dw 2.0
output application/json
import modules::countryLookup as countries

var address = payload.requestBody.payload
---
{
	ID: address.Cin7_AccountID__c,
		
	Addresses: [
		{
			  Line1: address.Line_1__c default "",
	          Line2: address.Line_2__c default "",
	          City: address.City__c default "",
	          State: address.State__c default "",
	          Postcode: address.PostalCode__c default "",
	          Country: address.Country__c default "",
	          Type: address.Type__c,
	          DefaultForType: address.DefaultForType__c as Boolean default false,
		}
	],

}
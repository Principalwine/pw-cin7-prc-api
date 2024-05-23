%dw 2.0
output application/json
skipNullOn="everywhere"
import modules::countryLookup as countries

var address = payload.requestBody.payload
---
{
	ID: address.Cin7_AccountID__c,
		
	Addresses: [
		{
			  ID: address.Cin7ID__c,
			  Line1: address.Line_1__c default "",
	          Line2: address.Line_2__c default "",
	          City: address.City__c default "",
	          State: address.State__c default "",
	          Postcode: address.PostalCode__c default "",
	          Country: address.Country__c,
	          Type: address.Type__c,
	          DefaultForType: address.DefaultForType__c default false,
		}
	],
	
	Contacts: []

}
%dw 2.0
output application/json
import modules::countryLookup as countries
var defLocation = payload.requestBody.LocationList[0]
---
{
	"objectName": "Location",
 	"externalField": "Cin7ID__c",
 
	"data": 
	  [{
	    Name: defLocation.Name,
	    Cin7ID__c: defLocation.ID,
	    Address__City__s: defLocation.AddressCitySuburb,
	    Address__Street__s: defLocation.AddressLine2,
	    Address__PostalCode__s: defLocation.AddressZipPostCode,
	    Address__StateCode__s: defLocation.AddressStateProvince,
	    Address__CountryCode__s: countries::getCountryCode(defLocation.AddressCountry as String),
	
	}]
}

    
 
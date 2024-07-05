%dw 2.0
output application/json

import modules::countryLookup as countries

var locationId = payload.CustomerDetailsList map ((item, index) ->{accoundId: item.ID})
var accountCin7Id = payload.CustomerDetailsList[0].ID
var defLocation = payload.LocationList[0]
---

    
    payload.CustomerDetailsList map ((customer, index) ->
        Data: 
          [{
            Name: defLocation.Name,
            Cin7ID__c: defLocation.ID,

            Address__City__s: defLocation.AddressCitySuburb,
            Address__Street__s: defLocation.AddressLine2,
            Address__PostalCode__s: defLocation.AddressZipPostCode,
            Address__StateCode__s: defLocation.AddressStateProvince,
            Address__CountryCode__s: countries::getCountryCode(defLocation.AddressCountry as String),

        }]
        

    )
 
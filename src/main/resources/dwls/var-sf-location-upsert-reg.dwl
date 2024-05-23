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

            //Type__c: defLocation.Type,
            //DefaultForType__c: defLocation.IsDefault,
            Address__City__s: defLocation.AddressCitySuburb,
            Address__Street__s: defLocation.AddressLine2,
            Address__PostalCode__s: defLocation.AddressZipPostCode,
            Address__StateCode__s: defLocation.AddressStateProvince,
            Address__CountryCode__s: countries::getCountryCode(defLocation.AddressCountry as String),

        }]
        

    )
 


//customer.Addresses map ((item, index) -> 
//        {
//            Name: if(item.Type == "Shipping") item.Line2 else item.Line1,
//            Cin7ID__c: item.ID,
//
//            //Type__c: item.Type,
//            //DefaultForType__c: item.DefaultForType,
//            Address__City__s: item.City,
//            Address__Street__s: if(item.Type == "Shipping") item.Line2 
//            					else item.Line1 default "" ++ item.Line2 default "",
//            Address__PostalCode__s: item.Postcode,
//            Address__StateCode__s: item.State,
//            Address__CountryCode__s: countries::getCountryCode(item.Country as String),
//            //(Delivery_Instruction__c: item.Line1) if(item.Type == 'Shipping')
//         })  
//
//        ++



//%dw 2.0
//output application/json
//---
//    payload.LocationList map ((item, index) ->{
//    Cin7ID__c: item.ID,
//Name: item.Name,
////IsDefault__c: item.IsDefault
//DefaultForType__c: item.IsDefault
//})
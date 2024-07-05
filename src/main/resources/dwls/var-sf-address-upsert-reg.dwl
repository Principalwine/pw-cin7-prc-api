%dw 2.0
output application/json
var accountCin7Id = payload.CustomerDetailsList[0].ID
---

    
    payload.CustomerDetailsList map ((customer, index) ->
        Data: customer.Addresses map ((item, index) -> 
        {
            Name: if(item.Type == "Shipping") item.Line2 else item.Line1,
            Cin7ID__c: item.ID,
            
            Type__c: item.Type,
            DefaultForType__c: item.DefaultForType,
            City__c: item.City,
            Line_1__c: item.Line1, 
            Line_2__c: item.Line2,
            PostalCode__c: item.Postcode,
            State__c: item.State,
            Country__c: item.Country as String,
            
            Account__r: {
                Cin7ID__c: accountCin7Id
            },
            LastModifiedOn__c: customer.LastModifiedOn
//            Location__r: {
//                Cin7ID__c: item.ID
//            }
        })       

    )

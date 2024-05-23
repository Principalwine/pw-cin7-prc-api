%dw 2.0
output application/json
import modules::lookUp as dl
import * from dw::core::Strings
---
flatten(payload.CustomerDetailsList map ((item, index) ->

{account__c: item.ID ,
	lastModified: item.LastModifiedOn,
Data: item.Contacts map (item, index) -> 
{Cin7ID__c: item.ID,
//LastName: item.Name,
(FirstName :(item.Name splitBy  (" "))[0]) if(sizeOf(item.Name splitBy  (" ")) > 1),
LastName: if(sizeOf(item.Name splitBy  (" ")) > 1) substringAfter(item.Name, " ") 
		  else item.Name,
Phone: item.Phone,
MobilePhone: item.MobilePhone,
Fax: item.Fax,
Email: item.Email,
Website__c: item.Website,
Comment__c: item.Comment,
Default__c: item.Default,
Include_In_Emails__c:item.IncludeInEmail,
Job_Title__c: item.JobTitle,
(Marketing_Consent__c: dl::getMarketingConsent(item.MarketingConsent as Number)) if(item.MarketingConsent != 0)
//LastModifiedOn__c:
//Cin7_AccountID__c
}
}
 ))
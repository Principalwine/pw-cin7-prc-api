%dw 2.0
output application/json
skipNullOn="everywhere"
var contact = payload.requestBody.payload
import modules::lookUp as dl
---
{
	ID: contact.Cin7_AccountID__c,
	Contacts: [
		{
		    ID: contact.Cin7ID__c,
		    Email: contact.Email,
			Default: contact.Default__c as Boolean default false,
		    IncludeInEmail: contact.Include_In_Emails__c as Boolean default false,
			Comment: contact.Comment__c,
			MobilePhone: contact.MobilePhone,
			Name: if(isEmpty(contact.LastName)) if(!isEmpty(contact.Name.FirstName))contact.Name.FirstName ++ " " ++ contact.Name.LastName
				  								else contact.Name.LastName
				  else if(!isEmpty(contact.FirstName))contact.FirstName ++ " " ++ contact.LastName
				  	   else contact.LastName,
			Phone: contact.Phone,
			Fax: contact.Fax,
			Website: contact.Website__c,
			JobTitle: contact.Job_Title__c,
			LastModifiedOn: contact.LastModifiedOn__c,
			(MarketingConsent: dl::getMarketingConsentForCin7(contact.Marketing_Consent__c as String)) if(!isEmpty(contact.Marketing_Consent__c))
		}
	]

}
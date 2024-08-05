%dw 2.0
output application/json
import modules::lookUp as dl
---[
    payload.LocationList map ((item, index) ->{location: item.ID}),
payload.CustomerDetailsList map ((item, index) -> 
{
    Cin7ID__c: item.ID,
Name: item.Name,
Status__c: item.Status,
Currency__c: item.Currency,
Payment_Term__c: item.PaymentTerm,
AccountReceivable__c: dl::getAccountReceivableType(item.AccountReceivable as String),
Tax_Rule__c: item.TaxRule,
Location_Name__c:item.Location,
Discount__c: item.Discount default 0,
Comments__c:item.Comments,
Credit_Limit__c: item.CreditLimit,
Tags__c:item.Tags,
Attribute_Set__c:item.AttributeSet default "Customer Attributes",
On_Credit_Hold__c:item.IsOnCreditHold,
Price_tier__c: item.PriceTier,
Default_Carrier__c: item.Carrier,
Sales_Representative__c: if(sizeOf(vars.query)== 1)vars.query[0].Id else (vars.query filter ($.Name != "Patrick Sullivan"))[0].Id,
OwnerId: if(sizeOf(vars.query)== 1)vars.query[0].Id else (vars.query filter ($.Name != "Patrick Sullivan"))[0].Id,
Tax_number__c: item.TaxNumber,
LastModifiedOn__c: item.LastModifiedOn,
"Revenue_Account__c": dl::getAccountType(item.RevenueAccount as String),
AdditionalAttribute1__c: item.AdditionalAttribute1,
Sync_with_Cin7__c: true
})]
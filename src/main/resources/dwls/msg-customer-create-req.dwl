%dw 2.0
output application/json
var item = payload.requestBody.payload
---
{
    Name: item.Name,
    Currency: item.Currency__c default "AUD",
    PaymentTerm: item.Payment_Term__c default "30 days",
    Discount: item.Discount__c as Number default 0,
    TaxRule: item.Tax_Rule__c default "GST on Income",
    Carrier: item.Default_Carrier__c default "DEFAULT Carrier",
    SalesRepresentative: item.Sales_Representative_Name__c default "Jez Prideaux",
    Location: item.Location_Name__c default "14 Degrees",
    Comments: item.Comments__c,
    AccountReceivable: item.AccountReceivable__c default "610",
    RevenueAccount: item.Revenue_Account__c default "200",
    PriceTier: item.PriceTier__c default "Wholesale",
    TaxNumber: item.Tax_number__c,
    //AttributeSet: item.Attribute_Set__c default "Customer Attributes",
    AttributeSet: item.Attribute_Set__c default "Customer Attributes",
    Tags: item.Tags__c,
    Status: item.Status__c default "",
    CreditLimit: item.Credit_Limit__c as Number default 0,
    IsOnCreditHold: item.On_Credit_Hold__c as Boolean default false,
    LastModifiedOn: item.LastModifiedDate,
    AdditionalAttribute1: item.AdditionalAttribute1__c default "",

    Addresses: [],
    Contacts: []
}
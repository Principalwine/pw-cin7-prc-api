%dw 2.0
output application/json
skipNullOn="everywhere"

var item = payload.requestBody.payload
---
{
    ID: item.Cin7ID__c,
    Name: item.Name,
    Currency: item.Currency__c,
    PaymentTerm: item.Payment_Term__c,
    Discount: item.Discount__c as Number default 0,
    TaxRule: item.Tax_Rule__c,
    Carrier: item.Default_Carrier__c,
    SalesRepresentative: item.Sales_Representative_Name__c,
    Location: item.Location_Name__c,
    Comments: item.Comments__c,
    AccountReceivable: item.AccountReceivable__c,
    RevenueAccount: item.Revenue_Account__c,
    PriceTier: item.PriceTier__c,
    TaxNumber: item.Tax_number__c,
    //AttributeSet: item.Attribute_Set__c,
    AttributeSet: item.Attribute_Set__c,
    Tags: item.Tags__c,
    Status: item.Status__c,
    CreditLimit: item.Credit_Limit__c as Number default 0,
    IsOnCreditHold: item.On_Credit_Hold__c as Boolean default false,
    LastModifiedOn: item.LastModifiedDate,
    AdditionalAttribute1: item.AdditionalAttribute1__c,

    Addresses: [],
    Contacts: []
}
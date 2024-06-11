%dw 2.0
output application/json
var order = vars.salesOrderDetails.data default {}
---
{
	Cin7_ID__c: order.ID,
	Cin7_AccountID__c: order.CustomerID,
	Account: {
		Cin7ID__c: order.CustomerID
	},
	(ContactId__r: {
		Cin7ID__c: (vars.accountDetails.data.CustomerList[0].Contacts default [] filter ((item, index) 
					-> item.Name ==  order.Contact))[0].ID default null
	}) if(!isEmpty(vars.accountDetails.data.CustomerList[0].Contacts default [] filter ((item, index) 
					-> item.Name ==  order.Contact))),
	
	(BillingCity: order.BillingAddress.City) if (!isEmpty(order.BillingAddress.City)),
	(BillingCountry: order.BillingAddress.Country) if (!isEmpty(order.BillingAddress.City)),
	(BillingState: order.BillingAddress.State) if (!isEmpty(order.BillingAddress.City)),
	BillingStreet: order.BillingAddress.Line1 default "" ++ order.BillingAddress.Line2 default "",
	(BillingPostalCode: order.BillingAddress.Postcode) if (!isEmpty(order.BillingAddress.City)),
	
	(ShippingCity: order.ShippingAddress.City) if (!isEmpty(order.ShippingAddress.City)),
	(ShippingCountry: order.ShippingAddress.Country) if (!isEmpty(order.ShippingAddress.City)),
	(ShippingState: order.ShippingAddress.State) if (!isEmpty(order.ShippingAddress.City)),
	ShippingStreet: order.ShippingAddress.Line1 default "" ++ order.ShippingAddress.Line2 default "",
	(ShippingPostalCode: order.ShippingAddress.Postcode) if (!isEmpty(order.ShippingAddress.City)),
	
	
	Phone__c: order.Phone,
	Email__c: order.Email,
	Default_Account__c: order.DefaultAccount,
	Skip_Quote__c: order.SkipQuote,
	Shipping_Notes__c: order.ShippingNotes,
	Base_Currency__c: order.BaseCurrency,
	Customer_Currency__c: order.CustomerCurrency,
	Tax_Rule__c: order.TaxRule,
	Tax_Calculation__c: order.TaxCalculation,
	Terms__c: order.Terms,
	PriceTier__c: order.PriceTier,
	Location__r: {
		Cin7ID__c: vars.locationDetails.data.LocationList[0].ID default null
	},
	
	//Sale_Order_Date__c: order.SaleOrderDate, This is Effective Date
	EffectiveDate: order.SaleOrderDate,
	(ShipBy__c: order.ShipBy) if(!isEmpty(order.ShipBy)),
	//EndDate: "2024-06-07T00:00:00", This is shipBy
	
	LastModifiedOn__c: order.LastModifiedOn,
	Note__c: order.Note,
	Customer_Reference__c: order.CustomerReference,
	COGS_Amount__c: order.COGSAmount,
	
	(Status: order.Status) if(order.Status == "DRAFT" or order.Status == "ESTIMATING" or order.Status == "ESTIMATED" or order.Status == "ORDERING"), //This is mandatory
	
	
	Combined_Picking_Status__c: order.CombinedPickingStatus,
	Combined_Packing_Status__c: order.CombinedPackingStatus,
	Combined_Shipping_Status__c: order.CombinedShippingStatus,
	FulFilment_Status__c: order.FulFilmentStatus,
	Combined_Invoice_Status__c: order.CombinedInvoiceStatus,
	Combined_Payment_Status__c: order.CombinedPaymentStatus,
	Combined_Tracking_Numbers__c: order.CombinedTrackingNumbers,
	Carrier__c: order.Carrier,
	Currency_Rate__c: order.CurrencyRate,
	Sales_Representative__c: if(sizeOf(vars.query)== 1)vars.query[0].Id else vars.query[0].Id,
	Type__c: order.Type,
	Source_Channel__c: order.SourceChannel,
	ExternalID__c: order.ExternalID,
	Service_Only__c: order.ServiceOnly,
	Tax_Iclusive__c: if(order.TaxCalculation == "Inclusive") true else false,
	Comments__c: order.Comments
}

%dw 2.0
output application/json
var order = payload.data default {}
---
{
	Cin7_ID__c: order.ID,
	Cin7_AccountID__c: order.CustomerID,
	Account: {
		Cin7ID__c: order.CustomerID
	},
	//ContactId__c: order.Contact,
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
	ShipBy__c: order.ShipBy,
	//Location__c: order.Location,
	//Sale_Order_Date__c: order.SaleOrderDate,
	LastModifiedOn__c: order.LastModifiedOn,
	Note__c: order.Note,
	Customer_Reference__c: order.CustomerReference,
	COGS_Amount__c: order.COGSAmount,
	
	Status: "Draft", //This is mandatory
	EffectiveDate: order.SaleOrderDate,
	//EndDate: "2024-06-07T00:00:00",
	Combined_Picking_Status__c: order.CombinedPickingStatus,
	Combined_Packing_Status__c: order.CombinedPackingStatus,
	Combined_Shipping_Status__c: order.CombinedShippingStatus,
	FulFilment_Status__c: order.FulFilmentStatus,
	Combined_Invoice_Status__c: order.CombinedInvoiceStatus,
	Combined_Payment_Status__c: order.CombinedPaymentStatus,
	Combined_Tracking_Numbers__c: order.CombinedTrackingNumbers,
	Carrier__c: order.Carrier,
	Currency_Rate__c: order.CurrencyRate,
	//Sales_Representative__c: order.SalesRepresentative,

	Type__c: order.Type,
	Source_Channel__c: order.SourceChannel,
	ExternalID__c: order.ExternalID,
	Service_Only__c: order.ServiceOnly,
	//Tax_Iclusive__c: order.TaxIclusive,
	Comments__c: order.Comments
}

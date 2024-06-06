%dw 2.0
output application/json
var priceBookNameAndId = [
  {
    "Id": "01s2w00000MsKTIAA3",
    "Name": "Standard Price Book",
    "cin7Label": "PriceTier0"
  },
  {
    "Id": "01s0T000000Be26QAC",
    "Name": "Wholesale",
    "cin7Label" : "PriceTier1"
  },
  {
    "Id": "01s0T000000Be4NQAS",
    "Name": "Buy",
    "cin7Label" : "PriceTier2"
  },
  {
    "Id": "01s0T000000Be4SQAS",
    "Name": "Buy - Euro",
    "cin7Label" : "PriceTier3"
  },
  {
    "Id": "01s0T000000Be4XQAS",
    "Name": "Buy - Pound",
    "cin7Label" : "PriceTier4"
  },
  {
    "Id": "01s0T000000Be4TQAS",
    "Name": "Wholesale - WA",
    "cin7Label" : "PriceTier5"
  },
  {
    "Id": "01s0T000000Be4YQAS",
    "Name": "Buy - NZD",
    "cin7Label" : "PriceTier6"
  },
  {
    "Id": "01s0T000000Be4hQAC",
    "Name": "Not Used (7)",
    "cin7Label" : "PriceTier7"
  },
  {
    "Id": "01s0T000000Be4mQAC",
    "Name": "Not Used (8)",
    "cin7Label" : "PriceTier8"
  },  
  {
    "Id": "01s0T000000Be4rQAC",
    "Name": "Not Used (9)",
    "cin7Label" : "PriceTier9"
  },
  {
    "Id": "01s0T000000Be4cQAC",
    "Name": "Baseline Cost",
    "cin7Label" : "PriceTier10"
  } 
]
---
{
	"objectName": "OrderItem",
  	"externalField": "Cin7ID__c",
  	"data":
	vars.salesOrderDetails.data.Order.Lines map (item, index) -> {
	    Cin7ID__c: vars.salesOrderDetails.data.ID ++  "-" ++  item.ProductID,
	    Product2:{
	        Cin7_Id__c: item.ProductID
	    },
	    Order:{
	        Cin7_ID__c: vars.salesOrderDetails.data.ID
	    },
	    PricebookEntry:{
	    	Cin7ID__c: item.ProductID ++ "-" ++ (priceBookNameAndId filter ((item, index) -> item.Name == vars.SalesOrderDetails.data.PriceTier))[0].cin7Label
	    },
	    UnitPrice: item.Price,
	    Quantity: item.Quantity,
	    Stock__r: {
	    	Cin7_StockID__c: item.ProductID ++ "-" ++ vars.locationDetails.data.LocationList[0].ID
	    },
		Total_Price__c: item.Total,
		Tax_Rule__c: item.TaxRule default "",
		Drop_Ship__c: item.DropShip default false,
		Comment__c: item.Comment default ""
	}
}
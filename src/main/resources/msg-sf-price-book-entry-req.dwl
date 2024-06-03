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
	
	"objectName": "PricebookEntry",
  	"externalField": "Cin7ID__c",
  	"data": (vars.requestPayload.requestBody.ProductDetailsList map (product, index) -> (
          priceBookNameAndId map(priceBook, index2) ->{
          	  Cin7ID__c: product.ID ++ "-" ++ priceBook.cin7Label default "",
              Pricebook2 : {
                  PriceTier__c: priceBook.cin7Label
              },
              Product2: {
                  Cin7_Id__c: product.ID
              },
              IsActive: true,
              //ProductCode: product.SKU, Not editable in SF
              UnitPrice: product.'$(priceBook.cin7Label)' default 0
          }
	    
      ))[0] default []
	
}
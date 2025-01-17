%dw 2.0
output application/json
var defLocation = vars.requestPayload.requestBody.LocationList[0].ID
---
{
	"objectName": "Product2",
  	"externalField": "Cin7_Id__c",
  	"data": vars.requestPayload.requestBody.ProductDetailsList map (product, index) -> {
	    Cin7_Id__c: product.ID,
	    
	    StockKeepingUnit: product.SKU,
	    Name: product.Name,
	    Category__c: product.Category,
	    Brand__c: product.Brand,
	    Type__c: product.Type,
	    Costing_Method__c: product.CostingMethod,
	    DropShipMode__c: product.DropShipMode,
	    //Default_Location__c: product.DefaultLocation,
	    
	    Default_Location__r: {
	        Cin7ID__c: defLocation
	    },
	    
	    Length__c: product.Length,
	    Width__c: product.Width,
	    Height__c: product.Height,
	    Weight__c: product.Weight,
	    Carton_Length__c: product.CartonLength,
	    Carton_Width__c: product.CartonWidth,
	    Carton_Height__c: product.CartonHeight,
	    Carton_Quantity__c: product.CartonQuantity,
	    Carton_Inner_Quantity__c: product.CartonInnerQuantity,
	    UOM__c: product.UOM,
	    Weight_Units__c: product.WeightUnits,
	    Dimensions_Units__c: product.DimensionsUnits,
	    Barcode__c: product.Barcode,
	    Minimum_Before_Reorder__c: product.MinimumBeforeReorder,
	    Reorder_Quantity__c: product.ReorderQuantity,
	    PriceTier1__c: product.PriceTier1,
	    PriceTier2__c: product.PriceTier2,
	    PriceTier3__c: product.PriceTier3,
	    PriceTier4__c: product.PriceTier4,
	    PriceTier5__c: product.PriceTier5,
	    PriceTier6__c: product.PriceTier6,
	    PriceTier7__c: product.PriceTier7,
	    PriceTier8__c: product.PriceTier8,
	    PriceTier9__c: product.PriceTier9,
	    PriceTier10__c: product.PriceTier10,
	
	    //It is in blue colour in sf
	    //PriceTiers__c: product.PriceTiers,
	
	    Average_Cost__c: product.AverageCost,
	    Short_Description__c: product.ShortDescription,
	    Description: product.Description,
	    Internal_Note__c: product.InternalNote,
	    AdditionalAttribute1__c: product.AdditionalAttribute1,
	    AdditionalAttribute2__c: product.AdditionalAttribute2,
	    AdditionalAttribute3__c: product.AdditionalAttribute3,
	    AdditionalAttribute4__c: product.AdditionalAttribute4,
	    AdditionalAttribute5__c: product.AdditionalAttribute5,
	    AdditionalAttribute6__c: product.AdditionalAttribute6,
	    AdditionalAttribute7__c: product.AdditionalAttribute7,
	    AdditionalAttribute8__c: product.AdditionalAttribute8,
	    AdditionalAttribute9__c: product.AdditionalAttribute9,
	    AdditionalAttribute10__c: product.AdditionalAttribute10,
	    Attribute_Set__c: product.AttributeSet,
	    Discount_Rule__c: product.DiscountRule,
	    Tags__c: product.Tags,
	    Status__c: product.Status,
	    Stock_Locator__c: product.StockLocator,
	    COGS_Account__c: product.COGSAccount,
	    Revenue_Account__c: product.RevenueAccount,
	    Expense_Account__c: product.ExpenseAccount,
	    Inventory_Account__c: product.InventoryAccount,
	    Purchase_Tax_Rule__c: product.PurchaseTaxRule,
	    Sale_Tax_Rule__c: product.SaleTaxRule,
	    LastModifiedOn__c: product.LastModifiedOn,
	    Sellable__c: product.Sellable default false,
	    Pick_Zones__c: product.PickZones,
	    Bill_Of_Material__c: product.BillOfMaterial,
	    
	    Auto_Assembly__c: product.AutoAssembly,
	    Auto_Disassembly__c: product.AutoDisassembly,
	    Quantity_To_Produce__c: product.QuantityToProduce,
	    Assembly_Instruction_URL__c: product.AssemblyInstructionURL,
	    Assembly_Cost_Estimation_Method__c: product.AssemblyCostEstimationMethod,
	    BOMType__c: product.BOMType,
	    HSCode__c: product.HSCode,
	    Country__c: product.CountryOfOrigin,
	    Country_Of_Origin_Code__c: product.CountryOfOriginCode,
	    Warranty__c: product.WarrantyName
	}
}

%dw 2.0
import * from dw::core::Strings
fun getAccountType(AccountType)=
	if (AccountType =="200") "200: Sales"
	else if (AccountType =="200.1") "200a: Freight & Picking Fees Collected"
	else if (AccountType =="200.2") "200b: Beer, Spirits, Grappa & Non Alch No WET"
	else if (AccountType =="202") "202: Wine for personal use"
	else if (AccountType =="203") "203: Fortified Wine WET Applies (below 22% Alch. by Vol)"
	else if (AccountType =="205") "205: Non-Quoted Wholesale Sales"
	else if (AccountType =="206") "206: Freight Collected"
	else if (AccountType =="207") "207: Consignment Sales"
	else if (AccountType =="208") "208: Consignment Sales WET not applicable"
	else if (AccountType =="210") "210: Export/International Sales"
	else if (AccountType =="215") "215: Cellar Door/Mail Order Sales"
	else if (AccountType =="220") "220: Distributor/Quoted Wholesale"
	else if (AccountType =="221") "221: Bulk Wine Sales [X Chart]"
	else if (AccountType =="230") "230: Agency Commissions"
	else if (AccountType =="240") "240: Sales - Barrels"
	else if (AccountType =="245") "245: WET Rebate"
	else if (AccountType =="260") "260: Administration Services"
	else if (AccountType =="264") "264: Sundry Revenue [X Chart]"
	else if (AccountType =="270") "270: Interest Income"
	else if (AccountType =="280") "280: Other Revenue"
	else if (AccountType =="281") "281: JobKeeper Subsidy"
	else if (AccountType =="283") "283: Management & Administration Recharge"
	else if (AccountType =="285") "285: Overhead Reimbursement"
	else if (AccountType =="287") "287: Sundry Income"
	else if (AccountType =="291") "291: Government Grants & JobKeeper Subsidies"
	else null
	
fun getAccountReceivableType(accountReceivable)=
	if (accountReceivable =="610") "610: Accounts Receivable"
	else "610: Accounts Receivable"
	
fun getMarketingConsent(value)=
	if(value == 1) "Unknown"
	else if(value == 2) "Opt In"
	else if(value == 3) "Opt Out"
	else null
	
fun getMarketingConsentForCin7(value)=
	if(value == "Unknown") 1
	else if(value == "Opt In") 2
	else if(value == "Opt Out") 3
	else 0
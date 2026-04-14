
`ifndef __BaseTransaction__SV__
`define __BaseTransaction__SV__


virtual class CBaseTransaction extends CBaseObject;
  string strNameTransactionType;

pure virtual function string DisplayExtraData();

function string DISPLAY();
	DISPLAY = {"Transactie de tipul ", 
                   strNameTransactionType, 
                   " cu continutul: \n", 
                   DisplayExtraData()};
endfunction
  
endclass


`endif //__BaseTransaction__SV	
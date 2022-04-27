
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTenderPurchaseKind;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENTenderPurchaseKind implements Serializable {

	public static final int PURCHASEKIND_ZCP = 1; // зцп
	public static final int PURCHASEKIND_OPEN_TENDER = 2; // відкриті торги
	public static final int PURCHASEKIND_BTP = 3; // безтендерні цинові пропозиції
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENTENDERPURCHASEKIND";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTENDERPURCHASEKIND.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENTENDERPURCHASEKIND.NAME";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }


} // end of ENTenderPurchaseKindValueObject


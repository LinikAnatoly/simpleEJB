
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPowerReliabilityCategory;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENSettleTypeRef;

public class ENPowerReliabilityCategory implements Serializable {

	//Категорії надійності електропостачання			
	public static final int CAT1_CITY = 500000004;  // I категорія, місто 
	public static final int CAT1_LAND = 500000005;  // I категорія, село
	public static final int CAT2_CITY = 500000001;  // II категорія, місто 
	public static final int CAT2_LAND = 500000003;  // II категорія, село
	public static final int CAT3_CITY = 500000000;  // IIІ категорія, місто
	public static final int CAT3_LAND = 500000002;  // IIІ категорія, село
    public int  code = Integer.MIN_VALUE;
    public String  name; 
    public BigDecimal  coef; 
    public ENSettleTypeRef settleTypeRef = new ENSettleTypeRef();
    public static final String tableName = "ENPOWERRELIABILITYCTGR";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPOWERRELIABILITYCTGR.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENPOWERRELIABILITYCTGR.NAME";
    public static final String coef_Attr = "coef";
    public static final String coef_Field = "COEF";
    public static final String coef_QFielld = "ENPOWERRELIABILITYCTGR.COEF";
    public static final String settleTypeRef_Attr = "settleTypeRef";
    public static final String settleTypeRef_Field = "SETTLETYPEREFCODE";
    public static final String  settleTypeRef_QFielld = "ENPOWERRELIABILITYCTGR.SETTLETYPEREFCODE";



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


    public void setCoef(BigDecimal aValue){
       coef = aValue;
    }

    public BigDecimal getCoef(){
       return coef;
    }

    public void setSettleTypeRef(ENSettleTypeRef aValue){
       settleTypeRef = aValue;
    }

    public ENSettleTypeRef getSettleTypeRef(){
       return settleTypeRef;
    }

} // end of ENPowerReliabilityCategoryValueObject



//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSettleType;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENSettleType implements Serializable {

	/** тип местности - город */
	public static final int CITY = 0;

	/** тип местности - село */
	public static final int VILLAGE = 1;
    public int  code = Integer.MIN_VALUE;
    public String  name; 
    public BigDecimal  coef; 
    public static final String tableName = "ENSETTLETYPE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSETTLETYPE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENSETTLETYPE.NAME";
    public static final String coef_Attr = "coef";
    public static final String coef_Field = "COEF";
    public static final String coef_QFielld = "ENSETTLETYPE.COEF";



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


} // end of ENSettleTypeValueObject


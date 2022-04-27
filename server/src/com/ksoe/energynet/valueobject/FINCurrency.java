
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for FINCurrency;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class FINCurrency implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public String  shortName; 
    public String  isoAlphabeticCode; 
    public String  isoNumericCode; 
    public String  sign; 
    public static final String tableName = "FINCURRENCY";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "FINCURRENCY.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "FINCURRENCY.NAME";
    public static final String shortName_Attr = "shortName";
    public static final String shortName_Field = "SHORTNAME";
    public static final String shortName_QFielld = "FINCURRENCY.SHORTNAME";
    public static final String isoAlphabeticCode_Attr = "isoAlphabeticCode";
    public static final String isoAlphabeticCode_Field = "ISOALPHABETICCODE";
    public static final String isoAlphabeticCode_QFielld = "FINCURRENCY.ISOALPHABETICCODE";
    public static final String isoNumericCode_Attr = "isoNumericCode";
    public static final String isoNumericCode_Field = "ISONUMERICCODE";
    public static final String isoNumericCode_QFielld = "FINCURRENCY.ISONUMERICCODE";
    public static final String sign_Attr = "sign";
    public static final String sign_Field = "SIGN";
    public static final String sign_QFielld = "FINCURRENCY.SIGN";



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


    public void setShortName(String aValue){
       shortName = aValue;
    }

    public String getShortName(){
       return shortName;
    }


    public void setIsoAlphabeticCode(String aValue){
       isoAlphabeticCode = aValue;
    }

    public String getIsoAlphabeticCode(){
       return isoAlphabeticCode;
    }


    public void setIsoNumericCode(String aValue){
       isoNumericCode = aValue;
    }

    public String getIsoNumericCode(){
       return isoNumericCode;
    }


    public void setSign(String aValue){
       sign = aValue;
    }

    public String getSign(){
       return sign;
    }


} // end of FINCurrencyValueObject


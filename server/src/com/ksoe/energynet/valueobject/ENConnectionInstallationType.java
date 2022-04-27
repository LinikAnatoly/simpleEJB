
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENConnectionInstallationType;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENConnectionInstallationType implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  name; 
    public BigDecimal  coef; 
    public static final String tableName = "ENCONNECTIONINSTLLTNTP";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENCONNECTIONINSTLLTNTP.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENCONNECTIONINSTLLTNTP.NAME";
    public static final String coef_Attr = "coef";
    public static final String coef_Field = "COEF";
    public static final String coef_QFielld = "ENCONNECTIONINSTLLTNTP.COEF";



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


} // end of ENConnectionInstallationTypeValueObject


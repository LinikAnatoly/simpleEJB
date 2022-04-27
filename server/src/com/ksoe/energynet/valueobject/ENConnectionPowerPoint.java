
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENConnectionPowerPoint;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENConnectionPowerPoint implements Serializable {

	//—туп≥нь напруги в точц≥ приЇднанн€			
	public static final int TENSION_04 		= 1;  //0,4 к¬ 
	public static final int TENSION_6_10 	= 2;  //10 (6) к¬
	public static final int TENSION_27_35 	= 3;  //35 (27) к¬ 
	public static final int TENSION_110_154 = 4;  //110 (154) к¬
    public int  code = Integer.MIN_VALUE;
    public String  name; 
    public BigDecimal  coef; 
    public static final String tableName = "ENCONNECTIONPOWERPOINT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENCONNECTIONPOWERPOINT.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENCONNECTIONPOWERPOINT.NAME";
    public static final String coef_Attr = "coef";
    public static final String coef_Field = "COEF";
    public static final String coef_QFielld = "ENCONNECTIONPOWERPOINT.COEF";



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


} // end of ENConnectionPowerPointValueObject


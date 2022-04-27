
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENServicesObjectCalcType;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENServicesObjectCalcType implements Serializable {

    /** NET-4235 Розрахунок вартості згідно кошторису (старий метод) */
    public static final int BY_CALCULATION = 1;
    /** NET-4235 Розрахунок вартості на підставі фактичних витрат (новий метод) */
    public static final int BY_FACT = 2;

    
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENSERVICESOBJECTCALCTP";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSERVICESOBJECTCALCTP.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENSERVICESOBJECTCALCTP.NAME";


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


} // end of ENServicesObjectCalcTypeValueObject


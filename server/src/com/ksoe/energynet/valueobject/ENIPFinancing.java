
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENIPFinancing;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENIPFinancing implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENIPFINANCING";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENIPFINANCING.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENIPFINANCING.NAME";


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


} // end of ENIPFinancingValueObject


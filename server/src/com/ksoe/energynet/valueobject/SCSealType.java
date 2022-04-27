
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for SCSealType;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class SCSealType implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "SCSEALTYPE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "SCSEALTYPE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "SCSEALTYPE.NAME";



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


} // end of SCSealTypeValueObject


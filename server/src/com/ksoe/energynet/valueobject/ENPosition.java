
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPositionENPosition;  	
  */

import java.io.Serializable;


public class ENPosition implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public int  finCode = Integer.MIN_VALUE; 
    public static final String tableName = "ENPOSITION";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPOSITION.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENPOSITION.NAME";
    public static final String finCode_Attr = "finCode";
    public static final String finCode_Field = "FINCODE";
    public static final String finCode_QFielld = "ENPOSITION.FINCODE";


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

    public void setFinCode(int aValue){
       finCode = aValue;
    }

    public int getFinCode(){
       return finCode;
    }

;

} // end of ENPositionValueObject


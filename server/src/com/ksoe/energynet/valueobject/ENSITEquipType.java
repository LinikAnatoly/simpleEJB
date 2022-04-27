
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSITEquipTypeENSITEquipType;  	
  */

import java.io.Serializable;


public class ENSITEquipType implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public String  description; 
    public static final String tableName = "ENSITEQUIPTYPE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSITEQUIPTYPE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENSITEQUIPTYPE.NAME";
    public static final String description_Attr = "description";
    public static final String description_Field = "DESCRIPTION";
    public static final String description_QFielld = "ENSITEQUIPTYPE.DESCRIPTION";


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

    public void setDescription(String aValue){
       description = aValue;
    }

    public String getDescription(){
       return description;
    }

;

} // end of ENSITEquipTypeValueObject


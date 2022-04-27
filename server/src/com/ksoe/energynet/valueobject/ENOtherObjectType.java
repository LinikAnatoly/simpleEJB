
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENOtherObjectTypeENOtherObjectType;  	
  */

import java.io.Serializable;


public class ENOtherObjectType implements Serializable {

	public static final int METROLOGY_SUBSTATION = 1;
	public static final int EB = 2;
	
	public static final int EQUIPMENT = 3;
	public static final int EQUIPMENT_REPAIR = 4;
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENOTHEROBJECTTYPE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENOTHEROBJECTTYPE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENOTHEROBJECTTYPE.NAME";


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

;

} // end of ENOtherObjectTypeValueObject


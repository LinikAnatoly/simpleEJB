
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENDeliveryKindENDeliveryKind;  	
  */

import java.io.Serializable;


public class ENDeliveryKind implements Serializable {

	public static final int TRANSPORT_HOE = 1;
	public static final int TRANSPORT_OTHER = 2;
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENDELIVERYKIND";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENDELIVERYKIND.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENDELIVERYKIND.NAME";


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

} // end of ENDeliveryKindValueObject


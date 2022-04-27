
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENDistanceTypeENDistanceType;  	
  */

import java.io.Serializable;


public class ENDistanceType implements Serializable {

	public static final int DISTANCE_TO = 1;
	public static final int DISTANCE_ALONG = 2;
	public static final int DISTANCE_FROM = 3;
	public static final int DISTANCE_OTHER = 4;
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENDISTANCETYPE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENDISTANCETYPE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENDISTANCETYPE.NAME";


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

} // end of ENDistanceTypeValueObject


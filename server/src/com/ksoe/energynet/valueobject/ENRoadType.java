
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENRoadTypeENRoadType;  	
  */

import java.io.Serializable;


public class ENRoadType implements Serializable {

	public static final int HIGHWAY = 1;
	public static final int GROUND = 2;
	public static final int ROUTE = 3;
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENROADTYPE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENROADTYPE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENROADTYPE.NAME";


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

} // end of ENRoadTypeValueObject


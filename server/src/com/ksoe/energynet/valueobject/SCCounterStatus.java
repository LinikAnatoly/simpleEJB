
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for SCCounterStatus;  	
  */

import java.io.Serializable;


public class SCCounterStatus implements Serializable {

	public static final int GOOD = 1;
	public static final int IN_ACT = 2;
	public static final int CANCELED = 100;
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "SCCOUNTERSTATUS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "SCCOUNTERSTATUS.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "SCCOUNTERSTATUS.NAME";


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


} // end of SCCounterStatusValueObject


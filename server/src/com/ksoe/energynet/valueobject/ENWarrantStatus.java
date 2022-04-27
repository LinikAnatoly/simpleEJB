
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENWarrantStatus;  	
  */

import java.io.Serializable;


public class ENWarrantStatus implements Serializable {

	public static final int ACTIVE = 0;
	public static final int INACTIVE = 1;

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENWARRANTSTATUS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENWARRANTSTATUS.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENWARRANTSTATUS.NAME";


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


} // end of ENWarrantStatusValueObject


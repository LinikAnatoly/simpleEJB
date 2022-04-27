
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENActStatusENActStatus;  	
  */

import java.io.Serializable;


public class ENActStatus implements Serializable {

	public static final int GOOD = 1;
	public static final int CANCELED = 2;
	public static final int CLOSED = 3;
	public static final int SIGNATURE = 4;
	public static final int REVERSED = 5;
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENACTSTATUS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACTSTATUS.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENACTSTATUS.NAME";


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

} // end of ENActStatusValueObject


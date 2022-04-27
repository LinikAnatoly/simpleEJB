
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENCheckpointEventType;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENCheckpointEventType implements Serializable {
	
	public static final int MOVE_OUT = 1;
	public static final int MOVE_IN = 2;

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENCHECKPOINTEVENTTYPE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENCHECKPOINTEVENTTYPE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENCHECKPOINTEVENTTYPE.NAME";


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


} // end of ENCheckpointEventTypeValueObject


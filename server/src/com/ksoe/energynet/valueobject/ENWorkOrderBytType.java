
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENWorkOrderBytType;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENWorkOrderBytType implements Serializable {

	/** Змінні завдання, сформовані в EnergyNet */
	public static final int BY_ENERGYNET = 1;
	
	/** Змінні завдання для рейдових бригад, сформовані з білінгу */
	public static final int RAID_BY_BILLING = 2;
	
	/** Змінні завдання для зняття контрольних показників згідно заяв побутових споживачів */
	public static final int CONTROL = 3; 	
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENWORKORDERBYTTYPE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENWORKORDERBYTTYPE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENWORKORDERBYTTYPE.NAME";


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


} // end of ENWorkOrderBytTypeValueObject


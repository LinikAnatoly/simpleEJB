
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for SCSeal2WorkOrderBytKind;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class SCSeal2WorkOrderBytKind implements Serializable {
	
	/** Планова прив'язка */
	public static final int PLAN = 1;
	/** Фактична прив'язка */
	public static final int FACT = 2;

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "SCSEAL2WORKORDERBYTKND";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "SCSEAL2WORKORDERBYTKND.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "SCSEAL2WORKORDERBYTKND.NAME";



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


} // end of SCSeal2WorkOrderBytKindValueObject


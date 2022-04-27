
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENWorkOrderBytStatus;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENWorkOrderBytStatus implements Serializable {
	
	/** Чорнове */
	public static final int DRAFT = 1;
	/** Складене */
	public static final int FORMED = 2;	
	/** Затверджене */
	public static final int APPROVED = 3;
	/** Виконане */
	public static final int COMPLETED = 4;	
	/** Завершене */
	public static final int CLOSED = 5;
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENWORKORDERBYTSTATUS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENWORKORDERBYTSTATUS.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENWORKORDERBYTSTATUS.NAME";



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


} // end of ENWorkOrderBytStatusValueObject


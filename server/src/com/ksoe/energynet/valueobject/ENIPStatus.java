
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENIPStatus;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENIPStatus implements Serializable {
	
	/** Статус ИП - "Чорновий" */
	public static final int DRAFT = 1;
	/** Статус ИП - "Складений" */
	public static final int CREATED = 2;
	/** Статус ИП - "Затверджений" */
	public static final int APPROVED = 3;	

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENIPSTATUS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENIPSTATUS.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENIPSTATUS.NAME";


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


} // end of ENIPStatusValueObject


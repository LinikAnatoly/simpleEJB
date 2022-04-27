
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPayment2SOType;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENPayment2SOType implements Serializable {

	 
	public static final int ENPAYMENT2SOTYPE_PREPAYMENT = 1; /** Передоплата **/
	public static final int ENPAYMENT2SOTYPE_REPAYMENT = 2; /**Погашення заборгованості**/
	public static final int ENPAYMENT2SOTYPE_RETURN_PAY = 3; /**Повернення замовнику**/
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENPAYMENT2SOTYPE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPAYMENT2SOTYPE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENPAYMENT2SOTYPE.NAME";


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


} // end of ENPayment2SOTypeValueObject



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENBankingBillType;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENBankingBillType implements Serializable {
    /* плата за послуги  */
	public static final int PAY_SERVICES = 1; 
	/* плата за приєднання  */
	public static final int PAY_PRICONNECTION = 2;
	/** Бюджетні розрахунки  */
	public static final int PAY_BUDJET = 3;
	/** Розрахунки по інвест програмі  */
	public static final int PAY_INVEST = 4;
	/** плата за все остальное  */
	public static final int PAY_OTHER = 5;
	
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENBANKINGBILLTYPE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENBANKINGBILLTYPE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENBANKINGBILLTYPE.NAME";


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


} // end of ENBankingBillTypeValueObject


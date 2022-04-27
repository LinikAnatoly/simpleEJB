
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENAct2RQFKOrderType;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENAct2RQFKOrderType implements Serializable {
	
	/** Акты выполненых работ по услугам */
	public static final int SERVICES = 1;
	/** Приходные ордера на производство */
	public static final int PRODUCTION = 2;
	
	/** Доробка та послуги зі сторони */
	public static final int ACT_REFINEMENT_AND_SERVICES = 3;

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENACT2RQFKORDERTYPE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACT2RQFKORDERTYPE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENACT2RQFKORDERTYPE.NAME";


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


} // end of ENAct2RQFKOrderTypeValueObject


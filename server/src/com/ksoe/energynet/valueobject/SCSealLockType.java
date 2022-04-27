
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for SCSealLockType;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class SCSealLockType implements Serializable {

	public static final int  FOR_MOVED = 1;
	public static final int  FOR_FACT = 2;
	public static final int  FOR_WRITEOFF = 3;
	public static final int  FOR_PRIHOD = 4;   /* дл€ прихода */
	public static final int  FOR_WORKORDERBYT = 5; /* дл€ сменного задани€ Ёнергосбыта */
	/** «м≥на м≥сц€ збер≥ганн€*/
	public static final int  FOR_ZONECHANGING = 6;
	
    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "SCSEALLOCKTYPE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "SCSEALLOCKTYPE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "SCSEALLOCKTYPE.NAME";



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


} // end of SCSealLockTypeValueObject


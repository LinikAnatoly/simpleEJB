
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright ╘ 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENContractType;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENContractType implements Serializable {
	
	public static final int CONTRACT = 1; //  оняке бшанпю пеюкэмнцн днцнбнпю мю тнпле опнейерю днцнбнпю ярюмнбхряъ щрхл ярюрсянл 
	public static final int CONTRACT_PROJECT = 2; // еые гмювхряъ йюй опнейр  

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENCONTRACTTYPE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENCONTRACTTYPE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENCONTRACTTYPE.NAME";



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


} // end of ENContractTypeValueObject


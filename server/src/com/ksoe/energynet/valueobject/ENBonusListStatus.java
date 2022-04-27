
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENBonusListStatus;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;




public class ENBonusListStatus implements Serializable {
	


    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public static final String tableName = "ENBONUSLISTSTATUS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENBONUSLISTSTATUS.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENBONUSLISTSTATUS.NAME";



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


} // end of ENBonusListStatusValueObject


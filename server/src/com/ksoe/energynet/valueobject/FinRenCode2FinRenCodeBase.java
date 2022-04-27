
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for FinRenCode2FinRenCodeBase;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class FinRenCode2FinRenCodeBase implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  finRenCode; 
    public String  finRenCodeOut; 
    public int  priority = Integer.MIN_VALUE; 
    public static final String tableName = "FINRENCODE2FINRENCODBS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "FINRENCODE2FINRENCODBS.CODE";
    public static final String finRenCode_Attr = "finRenCode";
    public static final String finRenCode_Field = "FINRENCODE";
    public static final String finRenCode_QFielld = "FINRENCODE2FINRENCODBS.FINRENCODE";
    public static final String finRenCodeOut_Attr = "finRenCodeOut";
    public static final String finRenCodeOut_Field = "FINRENCODEOUT";
    public static final String finRenCodeOut_QFielld = "FINRENCODE2FINRENCODBS.FINRENCODEOUT";
    public static final String priority_Attr = "priority";
    public static final String priority_Field = "PRIORITY";
    public static final String priority_QFielld = "FINRENCODE2FINRENCODBS.PRIORITY";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setFinRenCode(String aValue){
       finRenCode = aValue;
    }

    public String getFinRenCode(){
       return finRenCode;
    }

    public void setFinRenCodeOut(String aValue){
       finRenCodeOut = aValue;
    }

    public String getFinRenCodeOut(){
       return finRenCodeOut;
    }

    public void setPriority(int aValue){
       priority = aValue;
    }

    public int getPriority(){
       return priority;
    }


} // end of FinRenCode2FinRenCodeBaseValueObject


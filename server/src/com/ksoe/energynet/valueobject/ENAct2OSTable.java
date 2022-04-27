
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENAct2OSTable;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENActRef;

public class ENAct2OSTable implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  num_un = Integer.MIN_VALUE; 
    public String  invNumber; 
    public ENActRef actRef = new ENActRef();
    public static final String tableName = "ENACT2OSTABLE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACT2OSTABLE.CODE";
    public static final String num_un_Attr = "num_un";
    public static final String num_un_Field = "NUM_UN";
    public static final String num_un_QFielld = "ENACT2OSTABLE.NUM_UN";
    public static final String invNumber_Attr = "invNumber";
    public static final String invNumber_Field = "INVNUMBER";
    public static final String invNumber_QFielld = "ENACT2OSTABLE.INVNUMBER";
    public static final String actRef_Attr = "actRef";
    public static final String actRef_Field = "ACTREFCODE";
    public static final String  actRef_QFielld = "ENACT2OSTABLE.ACTREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setNum_un(int aValue){
       num_un = aValue;
    }

    public int getNum_un(){
       return num_un;
    }

    public void setInvNumber(String aValue){
       invNumber = aValue;
    }

    public String getInvNumber(){
       return invNumber;
    }

    public void setActRef(ENActRef aValue){
       actRef = aValue;
    }

    public ENActRef getActRef(){
       return actRef;
    }

} // end of ENAct2OSTableValueObject


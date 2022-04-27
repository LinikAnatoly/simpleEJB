
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENAct2FinKodIst;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENActRef;
    import  com.ksoe.energynet.valueobject.references.FinKodIstRef;

public class ENAct2FinKodIst implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public ENActRef actRef = new ENActRef();
    public FinKodIstRef kodIstRef = new FinKodIstRef();
    public static final String tableName = "ENACT2FINKODIST";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACT2FINKODIST.CODE";
    public static final String actRef_Attr = "actRef";
    public static final String actRef_Field = "ACTREFCODE";
    public static final String  actRef_QFielld = "ENACT2FINKODIST.ACTREFCODE";
    public static final String kodIstRef_Attr = "kodIstRef";
    public static final String kodIstRef_Field = "KODISTREFCODE";
    public static final String  kodIstRef_QFielld = "ENACT2FINKODIST.KODISTREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setActRef(ENActRef aValue){
       actRef = aValue;
    }

    public ENActRef getActRef(){
       return actRef;
    }
    public void setKodIstRef(FinKodIstRef aValue){
       kodIstRef = aValue;
    }

    public FinKodIstRef getKodIstRef(){
       return kodIstRef;
    }

} // end of ENAct2FinKodIstValueObject


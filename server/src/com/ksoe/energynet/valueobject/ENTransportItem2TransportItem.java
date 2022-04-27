
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTransportItem2TransportItemENTransportItem2TransportItem;  	
  */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.ENTransportItemRef;

public class ENTransportItem2TransportItem implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public long  modify_time = Long.MIN_VALUE;
    public ENTransportItemRef inRef = new ENTransportItemRef();
    public ENTransportItemRef outRef = new ENTransportItemRef();
    public static final String tableName = "ENTRANSPRTTM2TRNSPRTTM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTRANSPRTTM2TRNSPRTTM.CODE";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENTRANSPRTTM2TRNSPRTTM.MODIFY_TIME";
    public static final String inRef_Attr = "inRef";
    public static final String inRef_Field = "INREFCODE";
    public static final String  inRef_QFielld = "ENTRANSPRTTM2TRNSPRTTM.INREFCODE";
    public static final String outRef_Attr = "outRef";
    public static final String outRef_Field = "OUTREFCODE";
    public static final String  outRef_QFielld = "ENTRANSPRTTM2TRNSPRTTM.OUTREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

;
    public void setInRef(ENTransportItemRef aValue){
       inRef = aValue;
    }

    public ENTransportItemRef getInRef(){
       return inRef;
    }
    public void setOutRef(ENTransportItemRef aValue){
       outRef = aValue;
    }

    public ENTransportItemRef getOutRef(){
       return outRef;
    }

} // end of ENTransportItem2TransportItemValueObject


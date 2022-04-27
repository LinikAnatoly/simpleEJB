
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTransport2ENEstimateENTransport2ENEstimate;  	
  */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.ENEstimateItemRef;
import com.ksoe.energynet.valueobject.references.ENTransportItemRef;

public class ENTransport2ENEstimate implements Serializable {

    public int  code = Integer.MIN_VALUE; 

    public long  modify_time = Long.MIN_VALUE;
    public ENTransportItemRef transportRef = new ENTransportItemRef();
    public ENEstimateItemRef estimateRef = new ENEstimateItemRef();
    public static final String tableName = "ENTRANSPORT2ENESTIMATE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTRANSPORT2ENESTIMATE.CODE";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENTRANSPORT2ENESTIMATE.MODIFY_TIME";
    public static final String transportRef_Attr = "transportRef";
    public static final String transportRef_Field = "TRANSPORTREFCODE";
    public static final String  transportRef_QFielld = "ENTRANSPORT2ENESTIMATE.TRANSPORTREFCODE";
    public static final String estimateRef_Attr = "estimateRef";
    public static final String estimateRef_Field = "ESTIMATEREFCODE";
    public static final String  estimateRef_QFielld = "ENTRANSPORT2ENESTIMATE.ESTIMATEREFCODE";


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
    public void setTransportRef(ENTransportItemRef aValue){
       transportRef = aValue;
    }

    public ENTransportItemRef getTransportRef(){
       return transportRef;
    }
    public void setEstimateRef(ENEstimateItemRef aValue){
       estimateRef = aValue;
    }

    public ENEstimateItemRef getEstimateRef(){
       return estimateRef;
    }

} // end of ENTransport2ENEstimateValueObject


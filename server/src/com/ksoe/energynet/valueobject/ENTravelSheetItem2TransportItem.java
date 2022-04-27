
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTravelSheetItem2TransportItemENTravelSheetItem2TransportItem;  	
  */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.ENTransportItemRef;
import com.ksoe.energynet.valueobject.references.ENTravelSheetItemRef;

public class ENTravelSheetItem2TransportItem implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public long  modify_time = Long.MIN_VALUE;
    public ENTravelSheetItemRef travelSheetItemRef = new ENTravelSheetItemRef();
    public ENTransportItemRef transportItemRef = new ENTransportItemRef();
    public static final String tableName = "ENTRAVLSHTTM2TRNSPRTTM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTRAVLSHTTM2TRNSPRTTM.CODE";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENTRAVLSHTTM2TRNSPRTTM.MODIFY_TIME";
    public static final String travelSheetItemRef_Attr = "travelSheetItemRef";
    public static final String travelSheetItemRef_Field = "TRAVELSHEETITEMREFCODE";
    public static final String  travelSheetItemRef_QFielld = "ENTRAVLSHTTM2TRNSPRTTM.TRAVELSHEETITEMREFCODE";
    public static final String transportItemRef_Attr = "transportItemRef";
    public static final String transportItemRef_Field = "TRANSPORTITEMREFCODE";
    public static final String  transportItemRef_QFielld = "ENTRAVLSHTTM2TRNSPRTTM.TRANSPORTITEMREFCODE";


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
    public void setTravelSheetItemRef(ENTravelSheetItemRef aValue){
       travelSheetItemRef = aValue;
    }

    public ENTravelSheetItemRef getTravelSheetItemRef(){
       return travelSheetItemRef;
    }
    public void setTransportItemRef(ENTransportItemRef aValue){
       transportItemRef = aValue;
    }

    public ENTransportItemRef getTransportItemRef(){
       return transportItemRef;
    }

} // end of ENTravelSheetItem2TransportItemValueObject


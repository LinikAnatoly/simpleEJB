
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENDeliveryOrderENDeliveryOrder;  	
  */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.ENTransportItemRef;

public class ENDeliveryOrder implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  commentGen; 
    public long  modify_time = Long.MIN_VALUE;
    public ENTransportItemRef transportInRef = new ENTransportItemRef();
    public ENTransportItem transportOut = new ENTransportItem();
    public static final String tableName = "ENDELIVERYORDER";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENDELIVERYORDER.CODE";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENDELIVERYORDER.COMMENTGEN";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENDELIVERYORDER.MODIFY_TIME";
    public static final String transportInRef_Attr = "transportInRef";
    public static final String transportInRef_Field = "TRANSPORTINREFCODE";
    public static final String  transportInRef_QFielld = "ENDELIVERYORDER.TRANSPORTINREFCODE";
    public static final String transportOut_Attr = "transportOut";
    public static final String transportOut_Field = "TRANSPORTOUTCODE";
    public static final String  transportOut_QFielld = "ENDELIVERYORDER.TRANSPORTOUTCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }


    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

;
    public void setTransportInRef(ENTransportItemRef aValue){
       transportInRef = aValue;
    }

    public ENTransportItemRef getTransportInRef(){
       return transportInRef;
    }
    public void setTransportOut(ENTransportItem aValue){
       transportOut = aValue;
    }

    public ENTransportItem getTransportOut(){
       return transportOut;
    }

} // end of ENDeliveryOrderValueObject


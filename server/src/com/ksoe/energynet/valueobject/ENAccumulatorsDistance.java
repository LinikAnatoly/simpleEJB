
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENAccumulatorsDistance;
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENAccumulatorsRef;
import com.ksoe.energynet.valueobject.references.ENTravelSheetRef;
import com.ksoe.techcard.valueobject.references.TKTransportRealRef;

public class ENAccumulatorsDistance implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal recordDistance;
    public Date recordtDate;
    public ENAccumulatorsRef accumulatorsRef = new ENAccumulatorsRef();
    public TKTransportRealRef transportRealRef = new TKTransportRealRef();
    public ENTravelSheetRef travelSheetRef = new ENTravelSheetRef();
    public static final String tableName = "ENACCUMULATORSDISTANCE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACCUMULATORSDISTANCE.CODE";
    public static final String recordDistance_Attr = "recordDistance";
    public static final String recordDistance_Field = "RECORDDISTANCE";
    public static final String recordDistance_QFielld = "ENACCUMULATORSDISTANCE.RECORDDISTANCE";
    public static final String recordtDate_Attr = "recordtDate";
    public static final String recordtDate_Field = "RECORDTDATE";
    public static final String recordtDate_QFielld = "ENACCUMULATORSDISTANCE.RECORDTDATE";
    public static final String accumulatorsRef_Attr = "accumulatorsRef";
    public static final String accumulatorsRef_Field = "ACCUMULATORSREFCODE";
    public static final String  accumulatorsRef_QFielld = "ENACCUMULATORSDISTANCE.ACCUMULATORSREFCODE";
    public static final String transportRealRef_Attr = "transportRealRef";
    public static final String transportRealRef_Field = "TRANSPORTREALREFCODE";
    public static final String  transportRealRef_QFielld = "ENACCUMULATORSDISTANCE.TRANSPORTREALREFCODE";
    public static final String travelSheetRef_Attr = "travelSheetRef";
    public static final String travelSheetRef_Field = "TRAVELSHEETREFCODE";
    public static final String  travelSheetRef_QFielld = "ENACCUMULATORSDISTANCE.TRAVELSHEETREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setRecordDistance(BigDecimal aValue){
       recordDistance = aValue;
    }

    public BigDecimal getRecordDistance(){
       return recordDistance;
    }

    public void setRecordtDate(Date aValue){
       recordtDate = aValue;
    }

    public Date getRecordtDate(){
       return recordtDate;
    }

    public void setAccumulatorsRef(ENAccumulatorsRef aValue){
       accumulatorsRef = aValue;
    }

    public ENAccumulatorsRef getAccumulatorsRef(){
       return accumulatorsRef;
    }
    public void setTransportRealRef(TKTransportRealRef aValue){
       transportRealRef = aValue;
    }

    public TKTransportRealRef getTransportRealRef(){
       return transportRealRef;
    }
    public void setTravelSheetRef(ENTravelSheetRef aValue){
       travelSheetRef = aValue;
    }

    public ENTravelSheetRef getTravelSheetRef(){
       return travelSheetRef;
    }

} // end of ENAccumulatorsDistanceValueObject
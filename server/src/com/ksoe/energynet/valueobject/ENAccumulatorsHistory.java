
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENAccumulatorsHistory;
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENAccumulatorsRef;
import com.ksoe.techcard.valueobject.references.TKTransportRealRef;

public class ENAccumulatorsHistory implements Serializable {

    public int code = Integer.MIN_VALUE;
    public Date installDate;
    public Date uninstallDate;
    public BigDecimal distance;
    public String replacementReason;
    public String domain_info;
    public long modify_time = Long.MIN_VALUE;
    public ENAccumulatorsRef accumulatorsRef = new ENAccumulatorsRef();
    public TKTransportRealRef transportRealRef = new TKTransportRealRef();
    public static final String tableName = "ENACCUMULATORSHISTORY";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACCUMULATORSHISTORY.CODE";
    public static final String installDate_Attr = "installDate";
    public static final String installDate_Field = "INSTALLDATE";
    public static final String installDate_QFielld = "ENACCUMULATORSHISTORY.INSTALLDATE";
    public static final String uninstallDate_Attr = "uninstallDate";
    public static final String uninstallDate_Field = "UNINSTALLDATE";
    public static final String uninstallDate_QFielld = "ENACCUMULATORSHISTORY.UNINSTALLDATE";
    public static final String distance_Attr = "distance";
    public static final String distance_Field = "DISTANCE";
    public static final String distance_QFielld = "ENACCUMULATORSHISTORY.DISTANCE";
    public static final String replacementReason_Attr = "replacementReason";
    public static final String replacementReason_Field = "REPLACEMENTREASON";
    public static final String replacementReason_QFielld = "ENACCUMULATORSHISTORY.REPLACEMENTREASON";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "ENACCUMULATORSHISTORY.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENACCUMULATORSHISTORY.MODIFY_TIME";
    public static final String accumulatorsRef_Attr = "accumulatorsRef";
    public static final String accumulatorsRef_Field = "ACCUMULATORSREFCODE";
    public static final String  accumulatorsRef_QFielld = "ENACCUMULATORSHISTORY.ACCUMULATORSREFCODE";
    public static final String transportRealRef_Attr = "transportRealRef";
    public static final String transportRealRef_Field = "TRANSPORTREALREFCODE";
    public static final String  transportRealRef_QFielld = "ENACCUMULATORSHISTORY.TRANSPORTREALREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setInstallDate(Date aValue){
       installDate = aValue;
    }

    public Date getInstallDate(){
       return installDate;
    }

    public void setUninstallDate(Date aValue){
       uninstallDate = aValue;
    }

    public Date getUninstallDate(){
       return uninstallDate;
    }

    public void setDistance(BigDecimal aValue){
       distance = aValue;
    }

    public BigDecimal getDistance(){
       return distance;
    }

    public void setReplacementReason(String aValue){
       replacementReason = aValue;
    }

    public String getReplacementReason(){
       return replacementReason;
    }

    public void setDomain_info(String aValue){
       domain_info = aValue;
    }

    public String getDomain_info(){
       return domain_info;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
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

} // end of ENAccumulatorsHistoryValueObject

//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENAutoTiresHistory;
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENAutoTiresRef;
import com.ksoe.energynet.valueobject.references.ENTiresInstallPlacesRef;
import com.ksoe.techcard.valueobject.references.TKTransportRealRef;

public class ENAutoTiresHistory implements Serializable {

    public int code = Integer.MIN_VALUE;
    public Date installDate;
    public Date uninstallDate;
    public BigDecimal distance;
    public String actInstallNumber;
    public String actUninstallNumber;
    public String replacementReason;
    public String domain_info;
    public long modify_time = Long.MIN_VALUE;
    public ENAutoTiresRef tiresRef = new ENAutoTiresRef();
    public TKTransportRealRef transportRealRef = new TKTransportRealRef();
    public ENTiresInstallPlacesRef installPlacesRef = new ENTiresInstallPlacesRef();
    public static final String tableName = "ENAUTOTIRESHISTORY";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENAUTOTIRESHISTORY.CODE";
    public static final String installDate_Attr = "installDate";
    public static final String installDate_Field = "INSTALLDATE";
    public static final String installDate_QFielld = "ENAUTOTIRESHISTORY.INSTALLDATE";
    public static final String uninstallDate_Attr = "uninstallDate";
    public static final String uninstallDate_Field = "UNINSTALLDATE";
    public static final String uninstallDate_QFielld = "ENAUTOTIRESHISTORY.UNINSTALLDATE";
    public static final String distance_Attr = "distance";
    public static final String distance_Field = "DISTANCE";
    public static final String distance_QFielld = "ENAUTOTIRESHISTORY.DISTANCE";
    public static final String actInstallNumber_Attr = "actInstallNumber";
    public static final String actInstallNumber_Field = "ACTINSTALLNUMBER";
    public static final String actInstallNumber_QFielld = "ENAUTOTIRESHISTORY.ACTINSTALLNUMBER";
    public static final String actUninstallNumber_Attr = "actUninstallNumber";
    public static final String actUninstallNumber_Field = "ACTUNINSTALLNUMBER";
    public static final String actUninstallNumber_QFielld = "ENAUTOTIRESHISTORY.ACTUNINSTALLNUMBER";
    public static final String replacementReason_Attr = "replacementReason";
    public static final String replacementReason_Field = "REPLACEMENTREASON";
    public static final String replacementReason_QFielld = "ENAUTOTIRESHISTORY.REPLACEMENTREASON";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "ENAUTOTIRESHISTORY.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENAUTOTIRESHISTORY.MODIFY_TIME";
    public static final String tiresRef_Attr = "tiresRef";
    public static final String tiresRef_Field = "TIRESREFCODE";
    public static final String tiresRef_QFielld = "ENAUTOTIRESHISTORY.TIRESREFCODE";
    public static final String transportRealRef_Attr = "transportRealRef";
    public static final String transportRealRef_Field = "TRANSPORTREALREFCODE";
    public static final String transportRealRef_QFielld = "ENAUTOTIRESHISTORY.TRANSPORTREALREFCODE";
    public static final String installPlacesRef_Attr = "installPlacesRef";
    public static final String installPlacesRef_Field = "INSTALLPLACESREFCODE";
    public static final String installPlacesRef_QFielld = "ENAUTOTIRESHISTORY.INSTALLPLACESREFCODE";


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

    public void setActInstallNumber(String aValue){
    	actInstallNumber = aValue;
    }

    public String getActInstallNumber(){
       return actInstallNumber;
    }

    public void setActUninstallNumber(String aValue){
    	actUninstallNumber = aValue;
    }

    public String getActUninstallNumber(){
        return actUninstallNumber;
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

    public void setTiresRef(ENAutoTiresRef aValue){
       tiresRef = aValue;
    }

    public ENAutoTiresRef getTiresRef(){
       return tiresRef;
    }
    public void setTransportRealRef(TKTransportRealRef aValue){
       transportRealRef = aValue;
    }

    public TKTransportRealRef getTransportRealRef(){
       return transportRealRef;
    }
    public void setInstallPlacesRef(ENTiresInstallPlacesRef aValue){
       installPlacesRef = aValue;
    }

    public ENTiresInstallPlacesRef getInstallPlacesRef(){
       return installPlacesRef;
    }

} // end of ENAutoTiresHistoryValueObject

//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTravelSheet;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENTravelSheetStatusRef;
import com.ksoe.energynet.valueobject.references.ENTravelSheetTypeRef;
import com.ksoe.energynet.valueobject.references.ENTravelWorkModeRef;
import com.ksoe.techcard.valueobject.TKTransportReal;
    import  com.ksoe.energynet.valueobject.FINWorker;

public class ENTravelSheet implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  numberGen; 
    public Date dateStart ;
    public Date dateFinal ;
    public BigDecimal  speedometerStart; 
    public BigDecimal  speedometerFinal; 
    public BigDecimal  fuelCounterStart; 
    public BigDecimal  fuelCounterFinal; 
    public Date timeStart ;
    public Date timeFinal ;
    public String  commentGen; 
    public Date dateEdit ;
    public String  userGen; 
    public String  domain_info; 
    public long  modify_time = Long.MIN_VALUE;
    public int  isPrinted = Integer.MIN_VALUE; 
    public int  isMobiliztn = Integer.MIN_VALUE; 
    public ENDepartment department = new ENDepartment();
    public TKTransportReal transportReal = new TKTransportReal();
    public TKTransportReal trailer1 = new TKTransportReal();
    public TKTransportReal trailer2 = new TKTransportReal();
    public FINWorker finWorker = new FINWorker();
    public FINWorker finWorker_additional_1 = new FINWorker();
    public FINWorker finWorker_additional_2 = new FINWorker();
    public ENTravelWorkModeRef workModeRef = new ENTravelWorkModeRef();
    public ENTravelSheetTypeRef typeRef = new ENTravelSheetTypeRef();
    public ENTravelSheetStatusRef statusRef = new ENTravelSheetStatusRef();
    public static final String tableName = "ENTRAVELSHEET";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTRAVELSHEET.CODE";
    public static final String numberGen_Attr = "numberGen";
    public static final String numberGen_Field = "NUMBERGEN";
    public static final String numberGen_QFielld = "ENTRAVELSHEET.NUMBERGEN";
    public static final String dateStart_Attr = "dateStart";
    public static final String dateStart_Field = "DATESTART";
    public static final String dateStart_QFielld = "ENTRAVELSHEET.DATESTART";
    public static final String dateFinal_Attr = "dateFinal";
    public static final String dateFinal_Field = "DATEFINAL";
    public static final String dateFinal_QFielld = "ENTRAVELSHEET.DATEFINAL";
    public static final String speedometerStart_Attr = "speedometerStart";
    public static final String speedometerStart_Field = "SPEEDOMETERSTART";
    public static final String speedometerStart_QFielld = "ENTRAVELSHEET.SPEEDOMETERSTART";
    public static final String speedometerFinal_Attr = "speedometerFinal";
    public static final String speedometerFinal_Field = "SPEEDOMETERFINAL";
    public static final String speedometerFinal_QFielld = "ENTRAVELSHEET.SPEEDOMETERFINAL";
    public static final String fuelCounterStart_Attr = "fuelCounterStart";
    public static final String fuelCounterStart_Field = "FUELCOUNTERSTART";
    public static final String fuelCounterStart_QFielld = "ENTRAVELSHEET.FUELCOUNTERSTART";
    public static final String fuelCounterFinal_Attr = "fuelCounterFinal";
    public static final String fuelCounterFinal_Field = "FUELCOUNTERFINAL";
    public static final String fuelCounterFinal_QFielld = "ENTRAVELSHEET.FUELCOUNTERFINAL";
    public static final String timeStart_Attr = "timeStart";
    public static final String timeStart_Field = "TIMESTART";
    public static final String timeStart_QFielld = "ENTRAVELSHEET.TIMESTART";
    public static final String timeFinal_Attr = "timeFinal";
    public static final String timeFinal_Field = "TIMEFINAL";
    public static final String timeFinal_QFielld = "ENTRAVELSHEET.TIMEFINAL";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENTRAVELSHEET.COMMENTGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENTRAVELSHEET.DATEEDIT";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENTRAVELSHEET.USERGEN";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "ENTRAVELSHEET.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENTRAVELSHEET.MODIFY_TIME";
    public static final String isPrinted_Attr = "isPrinted";
    public static final String isPrinted_Field = "ISPRINTED";
    public static final String isPrinted_QFielld = "ENTRAVELSHEET.ISPRINTED";
    public static final String isMobiliztn_Attr = "isMobiliztn";
    public static final String isMobiliztn_Field = "ISMOBILIZTN";
    public static final String isMobiliztn_QFielld = "ENTRAVELSHEET.ISMOBILIZTN";
    public static final String department_Attr = "department";
    public static final String department_Field = "DEPARTMENTCODE";
    public static final String  department_QFielld = "ENTRAVELSHEET.DEPARTMENTCODE";
    public static final String transportReal_Attr = "transportReal";
    public static final String transportReal_Field = "TRANSPORTREALCODE";
    public static final String  transportReal_QFielld = "ENTRAVELSHEET.TRANSPORTREALCODE";
    public static final String trailer1_Attr = "trailer1";
    public static final String trailer1_Field = "TRAILER1CODE";
    public static final String  trailer1_QFielld = "ENTRAVELSHEET.TRAILER1CODE";
    public static final String trailer2_Attr = "trailer2";
    public static final String trailer2_Field = "TRAILER2CODE";
    public static final String  trailer2_QFielld = "ENTRAVELSHEET.TRAILER2CODE";
    public static final String finWorker_Attr = "finWorker";
    public static final String finWorker_Field = "FINWORKERCODE";
    public static final String  finWorker_QFielld = "ENTRAVELSHEET.FINWORKERCODE";
    public static final String finWorker_additional_1_Attr = "finWorker_additional_1";
    public static final String finWorker_additional_1_Field = "FINWORKER_ADDITINL_1CD";
    public static final String  finWorker_additional_1_QFielld = "ENTRAVELSHEET.FINWORKER_ADDITINL_1CD";
    public static final String finWorker_additional_2_Attr = "finWorker_additional_2";
    public static final String finWorker_additional_2_Field = "FINWORKER_ADDITINL_2CD";
    public static final String  finWorker_additional_2_QFielld = "ENTRAVELSHEET.FINWORKER_ADDITINL_2CD";
    public static final String workModeRef_Attr = "workModeRef";
    public static final String workModeRef_Field = "WORKMODEREFCODE";
    public static final String  workModeRef_QFielld = "ENTRAVELSHEET.WORKMODEREFCODE";
    public static final String typeRef_Attr = "typeRef";
    public static final String typeRef_Field = "TYPEREFCODE";
    public static final String  typeRef_QFielld = "ENTRAVELSHEET.TYPEREFCODE";
    public static final String statusRef_Attr = "statusRef";
    public static final String statusRef_Field = "STATUSREFCODE";
    public static final String  statusRef_QFielld = "ENTRAVELSHEET.STATUSREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setNumberGen(String aValue){
       numberGen = aValue;
    }

    public String getNumberGen(){
       return numberGen;
    }


    public void setDateStart(Date aValue){
       dateStart = aValue;
    }

    public Date getDateStart(){
       return dateStart;
    }


    public void setDateFinal(Date aValue){
       dateFinal = aValue;
    }

    public Date getDateFinal(){
       return dateFinal;
    }

    public void setSpeedometerStart(BigDecimal aValue){
       speedometerStart = aValue;
    }

    public BigDecimal getSpeedometerStart(){
       return speedometerStart;
    }

    public void setSpeedometerFinal(BigDecimal aValue){
       speedometerFinal = aValue;
    }

    public BigDecimal getSpeedometerFinal(){
       return speedometerFinal;
    }

    public void setFuelCounterStart(BigDecimal aValue){
       fuelCounterStart = aValue;
    }

    public BigDecimal getFuelCounterStart(){
       return fuelCounterStart;
    }

    public void setFuelCounterFinal(BigDecimal aValue){
       fuelCounterFinal = aValue;
    }

    public BigDecimal getFuelCounterFinal(){
       return fuelCounterFinal;
    }


    public void setTimeStart(Date aValue){
       timeStart = aValue;
    }

    public Date getTimeStart(){
       return timeStart;
    }


    public void setTimeFinal(Date aValue){
       timeFinal = aValue;
    }

    public Date getTimeFinal(){
       return timeFinal;
    }

    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }


    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }

    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
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

    public void setIsPrinted(int aValue){
       isPrinted = aValue;
    }

    public int getIsPrinted(){
       return isPrinted;
    }

    public void setIsMobiliztn(int aValue){
       isMobiliztn = aValue;
    }

    public int getIsMobiliztn(){
       return isMobiliztn;
    }
    public void setDepartment(ENDepartment aValue){
       department = aValue;
    }

    public ENDepartment getDepartment(){
       return department;
    }
    public void setTransportReal(TKTransportReal aValue){
       transportReal = aValue;
    }

    public TKTransportReal getTransportReal(){
       return transportReal;
    }
    public void setTrailer1(TKTransportReal aValue){
       trailer1 = aValue;
    }

    public TKTransportReal getTrailer1(){
       return trailer1;
    }
    public void setTrailer2(TKTransportReal aValue){
       trailer2 = aValue;
    }

    public TKTransportReal getTrailer2(){
       return trailer2;
    }
    public void setFinWorker(FINWorker aValue){
       finWorker = aValue;
    }

    public FINWorker getFinWorker(){
       return finWorker;
    }
    public void setFinWorker_additional_1(FINWorker aValue){
       finWorker_additional_1 = aValue;
    }

    public FINWorker getFinWorker_additional_1(){
       return finWorker_additional_1;
    }
    public void setFinWorker_additional_2(FINWorker aValue){
       finWorker_additional_2 = aValue;
    }

    public FINWorker getFinWorker_additional_2(){
       return finWorker_additional_2;
    }
    public void setWorkModeRef(ENTravelWorkModeRef aValue){
       workModeRef = aValue;
    }

    public ENTravelWorkModeRef getWorkModeRef(){
       return workModeRef;
    }
    public void setTypeRef(ENTravelSheetTypeRef aValue){
       typeRef = aValue;
    }

    public ENTravelSheetTypeRef getTypeRef(){
       return typeRef;
    }
    public void setStatusRef(ENTravelSheetStatusRef aValue){
       statusRef = aValue;
    }

    public ENTravelSheetStatusRef getStatusRef(){
       return statusRef;
    }

} // end of ENTravelSheetValueObject


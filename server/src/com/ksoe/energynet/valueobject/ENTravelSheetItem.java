
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTravelSheetItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENTravelSheetItemRef;
    import  com.ksoe.energynet.valueobject.references.ENTravelSheetRef;
    import  com.ksoe.energynet.valueobject.references.ENPlanWorkRef;
    import  com.ksoe.energynet.valueobject.references.ENTravelSheetItemKindRef;
    import  com.ksoe.energynet.valueobject.references.ENTravelSheetItemStatusRef;

public class ENTravelSheetItem implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  travelFrom; 
    public String  travelTo; 
    public Date timeStart;
    public Date timeFinal;
    public BigDecimal  speedometerStart; 
    public BigDecimal  speedometerFinal; 
    public BigDecimal  fuelCounterStart; 
    public BigDecimal  fuelCounterFinal; 
    public BigDecimal  sumDistances; 
    public BigDecimal  sumMachineHours; 
    public BigDecimal  heatingTime; 
    public String  commentGen; 
    public BigDecimal  rashodProbeg; 
    public BigDecimal  rashodWork; 
    public BigDecimal  transportKoef; 
    public BigDecimal  distanceByGPS; 
    public BigDecimal  hoursByGPS; 
    public BigDecimal  hoursInMotionByGPS; 
    public BigDecimal  hoursStopWorkByGPS; 
    public BigDecimal  hoursStopOffByGPS; 
    public int  travelOrder = Integer.MIN_VALUE;
    public Date dateEdit;
    public String  userGen; 
    public long  modify_time = Long.MIN_VALUE;

    public ENTravelSheetItemRef parentItemRef = new ENTravelSheetItemRef();
    public ENTravelSheetRef travelSheetRef = new ENTravelSheetRef();
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public ENTravelSheetItemKindRef kindRef = new ENTravelSheetItemKindRef();
    public ENTravelSheetItemStatusRef statusRef = new ENTravelSheetItemStatusRef();

    public static final String tableName = "ENTRAVELSHEETITEM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTRAVELSHEETITEM.CODE";
    public static final String travelFrom_Attr = "travelFrom";
    public static final String travelFrom_Field = "TRAVELFROM";
    public static final String travelFrom_QFielld = "ENTRAVELSHEETITEM.TRAVELFROM";
    public static final String travelTo_Attr = "travelTo";
    public static final String travelTo_Field = "TRAVELTO";
    public static final String travelTo_QFielld = "ENTRAVELSHEETITEM.TRAVELTO";
    public static final String timeStart_Attr = "timeStart";
    public static final String timeStart_Field = "TIMESTART";
    public static final String timeStart_QFielld = "ENTRAVELSHEETITEM.TIMESTART";
    public static final String timeFinal_Attr = "timeFinal";
    public static final String timeFinal_Field = "TIMEFINAL";
    public static final String timeFinal_QFielld = "ENTRAVELSHEETITEM.TIMEFINAL";
    public static final String speedometerStart_Attr = "speedometerStart";
    public static final String speedometerStart_Field = "SPEEDOMETERSTART";
    public static final String speedometerStart_QFielld = "ENTRAVELSHEETITEM.SPEEDOMETERSTART";
    public static final String speedometerFinal_Attr = "speedometerFinal";
    public static final String speedometerFinal_Field = "SPEEDOMETERFINAL";
    public static final String speedometerFinal_QFielld = "ENTRAVELSHEETITEM.SPEEDOMETERFINAL";
    public static final String fuelCounterStart_Attr = "fuelCounterStart";
    public static final String fuelCounterStart_Field = "FUELCOUNTERSTART";
    public static final String fuelCounterStart_QFielld = "ENTRAVELSHEETITEM.FUELCOUNTERSTART";
    public static final String fuelCounterFinal_Attr = "fuelCounterFinal";
    public static final String fuelCounterFinal_Field = "FUELCOUNTERFINAL";
    public static final String fuelCounterFinal_QFielld = "ENTRAVELSHEETITEM.FUELCOUNTERFINAL";
    public static final String sumDistances_Attr = "sumDistances";
    public static final String sumDistances_Field = "SUMDISTANCES";
    public static final String sumDistances_QFielld = "ENTRAVELSHEETITEM.SUMDISTANCES";
    public static final String sumMachineHours_Attr = "sumMachineHours";
    public static final String sumMachineHours_Field = "SUMMACHINEHOURS";
    public static final String sumMachineHours_QFielld = "ENTRAVELSHEETITEM.SUMMACHINEHOURS";
    public static final String heatingTime_Attr = "heatingTime";
    public static final String heatingTime_Field = "HEATINGTIME";
    public static final String heatingTime_QFielld = "ENTRAVELSHEETITEM.HEATINGTIME";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENTRAVELSHEETITEM.COMMENTGEN";
    public static final String rashodProbeg_Attr = "rashodProbeg";
    public static final String rashodProbeg_Field = "RASHODPROBEG";
    public static final String rashodProbeg_QFielld = "ENTRAVELSHEETITEM.RASHODPROBEG";
    public static final String rashodWork_Attr = "rashodWork";
    public static final String rashodWork_Field = "RASHODWORK";
    public static final String rashodWork_QFielld = "ENTRAVELSHEETITEM.RASHODWORK";
    public static final String transportKoef_Attr = "transportKoef";
    public static final String transportKoef_Field = "TRANSPORTKOEF";
    public static final String transportKoef_QFielld = "ENTRAVELSHEETITEM.TRANSPORTKOEF";
    public static final String distanceByGPS_Attr = "distanceByGPS";
    public static final String distanceByGPS_Field = "DISTANCEBYGPS";
    public static final String distanceByGPS_QFielld = "ENTRAVELSHEETITEM.DISTANCEBYGPS";
    public static final String hoursByGPS_Attr = "hoursByGPS";
    public static final String hoursByGPS_Field = "HOURSBYGPS";
    public static final String hoursByGPS_QFielld = "ENTRAVELSHEETITEM.HOURSBYGPS";
    public static final String hoursInMotionByGPS_Attr = "hoursInMotionByGPS";
    public static final String hoursInMotionByGPS_Field = "HOURSINMOTIONBYGPS";
    public static final String hoursInMotionByGPS_QFielld = "ENTRAVELSHEETITEM.HOURSINMOTIONBYGPS";
    public static final String hoursStopWorkByGPS_Attr = "hoursStopWorkByGPS";
    public static final String hoursStopWorkByGPS_Field = "HOURSSTOPWORKBYGPS";
    public static final String hoursStopWorkByGPS_QFielld = "ENTRAVELSHEETITEM.HOURSSTOPWORKBYGPS";
    public static final String hoursStopOffByGPS_Attr = "hoursStopOffByGPS";
    public static final String hoursStopOffByGPS_Field = "HOURSSTOPOFFBYGPS";
    public static final String hoursStopOffByGPS_QFielld = "ENTRAVELSHEETITEM.HOURSSTOPOFFBYGPS";
    public static final String travelOrder_Attr = "travelOrder";
    public static final String travelOrder_Field = "TRAVELORDER";
    public static final String travelOrder_QFielld = "ENTRAVELSHEETITEM.TRAVELORDER";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENTRAVELSHEETITEM.DATEEDIT";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENTRAVELSHEETITEM.USERGEN";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENTRAVELSHEETITEM.MODIFY_TIME";

    public static final String parentItemRef_Attr = "parentItemRef";
    public static final String parentItemRef_Field = "PARENTITEMREFCODE";
    public static final String  parentItemRef_QFielld = "ENTRAVELSHEETITEM.PARENTITEMREFCODE";
    public static final String travelSheetRef_Attr = "travelSheetRef";
    public static final String travelSheetRef_Field = "TRAVELSHEETREFCODE";
    public static final String  travelSheetRef_QFielld = "ENTRAVELSHEETITEM.TRAVELSHEETREFCODE";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENTRAVELSHEETITEM.PLANREFCODE";
    public static final String kindRef_Attr = "kindRef";
    public static final String kindRef_Field = "KINDREFCODE";
    public static final String  kindRef_QFielld = "ENTRAVELSHEETITEM.KINDREFCODE";
    public static final String statusRef_Attr = "statusRef";
    public static final String statusRef_Field = "STATUSREFCODE";
    public static final String  statusRef_QFielld = "ENTRAVELSHEETITEM.STATUSREFCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public String getTravelFrom(){
       return travelFrom;
    }
    
    public void setTravelFrom(String travelFrom){
       this.travelFrom = travelFrom;
    }


    public String getTravelTo(){
       return travelTo;
    }
    
    public void setTravelTo(String travelTo){
       this.travelTo = travelTo;
    }


    public Date getTimeStart(){
       return timeStart;
    }

    public void setTimeStart(Date timeStart){
       this.timeStart = timeStart;
    }


    public Date getTimeFinal(){
       return timeFinal;
    }

    public void setTimeFinal(Date timeFinal){
       this.timeFinal = timeFinal;
    }


    public BigDecimal getSpeedometerStart(){
       return speedometerStart;
    }
    
    public void setSpeedometerStart(BigDecimal speedometerStart){
       this.speedometerStart = speedometerStart;
    }


    public BigDecimal getSpeedometerFinal(){
       return speedometerFinal;
    }
    
    public void setSpeedometerFinal(BigDecimal speedometerFinal){
       this.speedometerFinal = speedometerFinal;
    }


    public BigDecimal getFuelCounterStart(){
       return fuelCounterStart;
    }
    
    public void setFuelCounterStart(BigDecimal fuelCounterStart){
       this.fuelCounterStart = fuelCounterStart;
    }


    public BigDecimal getFuelCounterFinal(){
       return fuelCounterFinal;
    }
    
    public void setFuelCounterFinal(BigDecimal fuelCounterFinal){
       this.fuelCounterFinal = fuelCounterFinal;
    }


    public BigDecimal getSumDistances(){
       return sumDistances;
    }
    
    public void setSumDistances(BigDecimal sumDistances){
       this.sumDistances = sumDistances;
    }


    public BigDecimal getSumMachineHours(){
       return sumMachineHours;
    }
    
    public void setSumMachineHours(BigDecimal sumMachineHours){
       this.sumMachineHours = sumMachineHours;
    }


    public BigDecimal getHeatingTime(){
       return heatingTime;
    }
    
    public void setHeatingTime(BigDecimal heatingTime){
       this.heatingTime = heatingTime;
    }


    public String getCommentGen(){
       return commentGen;
    }
    
    public void setCommentGen(String commentGen){
       this.commentGen = commentGen;
    }


    public BigDecimal getRashodProbeg(){
       return rashodProbeg;
    }
    
    public void setRashodProbeg(BigDecimal rashodProbeg){
       this.rashodProbeg = rashodProbeg;
    }


    public BigDecimal getRashodWork(){
       return rashodWork;
    }
    
    public void setRashodWork(BigDecimal rashodWork){
       this.rashodWork = rashodWork;
    }


    public BigDecimal getTransportKoef(){
       return transportKoef;
    }
    
    public void setTransportKoef(BigDecimal transportKoef){
       this.transportKoef = transportKoef;
    }


    public BigDecimal getDistanceByGPS(){
       return distanceByGPS;
    }
    
    public void setDistanceByGPS(BigDecimal distanceByGPS){
       this.distanceByGPS = distanceByGPS;
    }


    public BigDecimal getHoursByGPS(){
       return hoursByGPS;
    }
    
    public void setHoursByGPS(BigDecimal hoursByGPS){
       this.hoursByGPS = hoursByGPS;
    }


    public BigDecimal getHoursInMotionByGPS(){
       return hoursInMotionByGPS;
    }
    
    public void setHoursInMotionByGPS(BigDecimal hoursInMotionByGPS){
       this.hoursInMotionByGPS = hoursInMotionByGPS;
    }


    public BigDecimal getHoursStopWorkByGPS(){
       return hoursStopWorkByGPS;
    }
    
    public void setHoursStopWorkByGPS(BigDecimal hoursStopWorkByGPS){
       this.hoursStopWorkByGPS = hoursStopWorkByGPS;
    }


    public BigDecimal getHoursStopOffByGPS(){
       return hoursStopOffByGPS;
    }
    
    public void setHoursStopOffByGPS(BigDecimal hoursStopOffByGPS){
       this.hoursStopOffByGPS = hoursStopOffByGPS;
    }


    public int getTravelOrder(){
       return travelOrder;
    }
    
    public void setTravelOrder(int travelOrder){
       this.travelOrder = travelOrder;
    }


    public Date getDateEdit(){
       return dateEdit;
    }

    public void setDateEdit(Date dateEdit){
       this.dateEdit = dateEdit;
    }


    public String getUserGen(){
       return userGen;
    }
    
    public void setUserGen(String userGen){
       this.userGen = userGen;
    }


    public long getModify_time(){
       return modify_time;
    }
    
    public void setModify_time(long modify_time){
       this.modify_time = modify_time;
    }

    public ENTravelSheetItemRef getParentItemRef(){
       return parentItemRef;
    }
    
    public void setParentItemRef(ENTravelSheetItemRef parentItemRef){
       this.parentItemRef = parentItemRef;
    }
    public ENTravelSheetRef getTravelSheetRef(){
       return travelSheetRef;
    }
    
    public void setTravelSheetRef(ENTravelSheetRef travelSheetRef){
       this.travelSheetRef = travelSheetRef;
    }
    public ENPlanWorkRef getPlanRef(){
       return planRef;
    }
    
    public void setPlanRef(ENPlanWorkRef planRef){
       this.planRef = planRef;
    }
    public ENTravelSheetItemKindRef getKindRef(){
       return kindRef;
    }
    
    public void setKindRef(ENTravelSheetItemKindRef kindRef){
       this.kindRef = kindRef;
    }
    public ENTravelSheetItemStatusRef getStatusRef(){
       return statusRef;
    }
    
    public void setStatusRef(ENTravelSheetItemStatusRef statusRef){
       this.statusRef = statusRef;
    }

} // end of ENTravelSheetItemValueObject


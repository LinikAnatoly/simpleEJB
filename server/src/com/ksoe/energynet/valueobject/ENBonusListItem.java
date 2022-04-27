
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENBonusListItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENBonusListRef;
    import  com.ksoe.energynet.valueobject.references.ENBonusListItemStatusRef;

public class ENBonusListItem implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public String  podrId; 
    public String  podrName; 
    public String  fio; 
    public String  tabNumber; 
    public String  positionId; 
    public String  positionName; 
    public BigDecimal  fundWorkTime; 
    public BigDecimal  workTimeFact; 
    public BigDecimal  hoursWorkedWithStaff; 
    public BigDecimal  timeDelivery; 
    public BigDecimal  hoursWorkedPlan; 
    public BigDecimal  hoursWorkedNotPlan; 
    public BigDecimal  hoursWorkedSum; 
    public BigDecimal  percentLoadWork; 
    public BigDecimal  percentLoadByPlanWork; 
    public BigDecimal  percentLoadByNotPlanWork; 
    public BigDecimal  percentBonus; 
    public BigDecimal  coefficient; 
    public BigDecimal  percentBonusForCharging; 
    public BigDecimal  countFactWorkedDays; 
    public String  tradeCategoryId; 
    public Date dateStart ;
    public Date dateFinal ;
    public BigDecimal  noWayOutFromPeriod; 
    public BigDecimal  summaCompensation; 
    public BigDecimal  coefficientQuality; 
    public String  userAdd; 
    public Date dateAdd ;
    public String  userGen; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public String  reasonInvalid; 
    public String  userSetInvalid; 
    public Date dateSetInvalid ;
    public ENBonusListRef bonusList = new ENBonusListRef();
    public ENBonusListItemStatusRef status = new ENBonusListItemStatusRef();
    public static final String tableName = "ENBONUSLISTITEM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENBONUSLISTITEM.CODE";
    public static final String podrId_Attr = "podrId";
    public static final String podrId_Field = "PODRID";
    public static final String podrId_QFielld = "ENBONUSLISTITEM.PODRID";
    public static final String podrName_Attr = "podrName";
    public static final String podrName_Field = "PODRNAME";
    public static final String podrName_QFielld = "ENBONUSLISTITEM.PODRNAME";
    public static final String fio_Attr = "fio";
    public static final String fio_Field = "FIO";
    public static final String fio_QFielld = "ENBONUSLISTITEM.FIO";
    public static final String tabNumber_Attr = "tabNumber";
    public static final String tabNumber_Field = "TABNUMBER";
    public static final String tabNumber_QFielld = "ENBONUSLISTITEM.TABNUMBER";
    public static final String positionId_Attr = "positionId";
    public static final String positionId_Field = "POSITIONID";
    public static final String positionId_QFielld = "ENBONUSLISTITEM.POSITIONID";
    public static final String positionName_Attr = "positionName";
    public static final String positionName_Field = "POSITIONNAME";
    public static final String positionName_QFielld = "ENBONUSLISTITEM.POSITIONNAME";
    public static final String fundWorkTime_Attr = "fundWorkTime";
    public static final String fundWorkTime_Field = "FUNDWORKTIME";
    public static final String fundWorkTime_QFielld = "ENBONUSLISTITEM.FUNDWORKTIME";
    public static final String workTimeFact_Attr = "workTimeFact";
    public static final String workTimeFact_Field = "WORKTIMEFACT";
    public static final String workTimeFact_QFielld = "ENBONUSLISTITEM.WORKTIMEFACT";
    public static final String hoursWorkedWithStaff_Attr = "hoursWorkedWithStaff";
    public static final String hoursWorkedWithStaff_Field = "HOURSWORKEDWITHSTAFF";
    public static final String hoursWorkedWithStaff_QFielld = "ENBONUSLISTITEM.HOURSWORKEDWITHSTAFF";
    public static final String timeDelivery_Attr = "timeDelivery";
    public static final String timeDelivery_Field = "TIMEDELIVERY";
    public static final String timeDelivery_QFielld = "ENBONUSLISTITEM.TIMEDELIVERY";
    public static final String hoursWorkedPlan_Attr = "hoursWorkedPlan";
    public static final String hoursWorkedPlan_Field = "HOURSWORKEDPLAN";
    public static final String hoursWorkedPlan_QFielld = "ENBONUSLISTITEM.HOURSWORKEDPLAN";
    public static final String hoursWorkedNotPlan_Attr = "hoursWorkedNotPlan";
    public static final String hoursWorkedNotPlan_Field = "HOURSWORKEDNOTPLAN";
    public static final String hoursWorkedNotPlan_QFielld = "ENBONUSLISTITEM.HOURSWORKEDNOTPLAN";
    public static final String hoursWorkedSum_Attr = "hoursWorkedSum";
    public static final String hoursWorkedSum_Field = "HOURSWORKEDSUM";
    public static final String hoursWorkedSum_QFielld = "ENBONUSLISTITEM.HOURSWORKEDSUM";
    public static final String percentLoadWork_Attr = "percentLoadWork";
    public static final String percentLoadWork_Field = "PERCENTLOADWORK";
    public static final String percentLoadWork_QFielld = "ENBONUSLISTITEM.PERCENTLOADWORK";
    public static final String percentLoadByPlanWork_Attr = "percentLoadByPlanWork";
    public static final String percentLoadByPlanWork_Field = "PERCENTLOADBYPLANWORK";
    public static final String percentLoadByPlanWork_QFielld = "ENBONUSLISTITEM.PERCENTLOADBYPLANWORK";
    public static final String percentLoadByNotPlanWork_Attr = "percentLoadByNotPlanWork";
    public static final String percentLoadByNotPlanWork_Field = "PERCENTLOADBYNOTPLANWORK";
    public static final String percentLoadByNotPlanWork_QFielld = "ENBONUSLISTITEM.PERCENTLOADBYNOTPLNWRK";
    public static final String percentBonus_Attr = "percentBonus";
    public static final String percentBonus_Field = "PERCENTBONUS";
    public static final String percentBonus_QFielld = "ENBONUSLISTITEM.PERCENTBONUS";
    public static final String coefficient_Attr = "coefficient";
    public static final String coefficient_Field = "COEFFICIENT";
    public static final String coefficient_QFielld = "ENBONUSLISTITEM.COEFFICIENT";
    public static final String percentBonusForCharging_Attr = "percentBonusForCharging";
    public static final String percentBonusForCharging_Field = "PERCENTBONUSFORCHARGING";
    public static final String percentBonusForCharging_QFielld = "ENBONUSLISTITEM.PERCENTBONUSFORCHARGNG";
    public static final String countFactWorkedDays_Attr = "countFactWorkedDays";
    public static final String countFactWorkedDays_Field = "COUNTFACTWORKEDDAYS";
    public static final String countFactWorkedDays_QFielld = "ENBONUSLISTITEM.COUNTFACTWORKEDDAYS";
    public static final String tradeCategoryId_Attr = "tradeCategoryId";
    public static final String tradeCategoryId_Field = "TRADECATEGORYID";
    public static final String tradeCategoryId_QFielld = "ENBONUSLISTITEM.TRADECATEGORYID";
    public static final String dateStart_Attr = "dateStart";
    public static final String dateStart_Field = "DATESTART";
    public static final String dateStart_QFielld = "ENBONUSLISTITEM.DATESTART";
    public static final String dateFinal_Attr = "dateFinal";
    public static final String dateFinal_Field = "DATEFINAL";
    public static final String dateFinal_QFielld = "ENBONUSLISTITEM.DATEFINAL";
    public static final String noWayOutFromPeriod_Attr = "noWayOutFromPeriod";
    public static final String noWayOutFromPeriod_Field = "NOWAYOUTFROMPERIOD";
    public static final String noWayOutFromPeriod_QFielld = "ENBONUSLISTITEM.NOWAYOUTFROMPERIOD";
    public static final String summaCompensation_Attr = "summaCompensation";
    public static final String summaCompensation_Field = "SUMMACOMPENSATION";
    public static final String summaCompensation_QFielld = "ENBONUSLISTITEM.SUMMACOMPENSATION";
    public static final String coefficientQuality_Attr = "coefficientQuality";
    public static final String coefficientQuality_Field = "COEFFICIENTQUALITY";
    public static final String coefficientQuality_QFielld = "ENBONUSLISTITEM.COEFFICIENTQUALITY";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "ENBONUSLISTITEM.USERADD";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENBONUSLISTITEM.DATEADD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENBONUSLISTITEM.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENBONUSLISTITEM.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENBONUSLISTITEM.MODIFY_TIME";
    public static final String reasonInvalid_Attr = "reasonInvalid";
    public static final String reasonInvalid_Field = "REASONINVALID";
    public static final String reasonInvalid_QFielld = "ENBONUSLISTITEM.REASONINVALID";
    public static final String userSetInvalid_Attr = "userSetInvalid";
    public static final String userSetInvalid_Field = "USERSETINVALID";
    public static final String userSetInvalid_QFielld = "ENBONUSLISTITEM.USERSETINVALID";
    public static final String dateSetInvalid_Attr = "dateSetInvalid";
    public static final String dateSetInvalid_Field = "DATESETINVALID";
    public static final String dateSetInvalid_QFielld = "ENBONUSLISTITEM.DATESETINVALID";
    public static final String bonusList_Attr = "bonusList";
    public static final String bonusList_Field = "BONUSLISTCODE";
    public static final String  bonusList_QFielld = "ENBONUSLISTITEM.BONUSLISTCODE";
    public static final String status_Attr = "status";
    public static final String status_Field = "STATUSCODE";
    public static final String  status_QFielld = "ENBONUSLISTITEM.STATUSCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setPodrId(String aValue){
       podrId = aValue;
    }

    public String getPodrId(){
       return podrId;
    }


    public void setPodrName(String aValue){
       podrName = aValue;
    }

    public String getPodrName(){
       return podrName;
    }


    public void setFio(String aValue){
       fio = aValue;
    }

    public String getFio(){
       return fio;
    }


    public void setTabNumber(String aValue){
       tabNumber = aValue;
    }

    public String getTabNumber(){
       return tabNumber;
    }


    public void setPositionId(String aValue){
       positionId = aValue;
    }

    public String getPositionId(){
       return positionId;
    }


    public void setPositionName(String aValue){
       positionName = aValue;
    }

    public String getPositionName(){
       return positionName;
    }


    public void setFundWorkTime(BigDecimal aValue){
       fundWorkTime = aValue;
    }

    public BigDecimal getFundWorkTime(){
       return fundWorkTime;
    }


    public void setWorkTimeFact(BigDecimal aValue){
       workTimeFact = aValue;
    }

    public BigDecimal getWorkTimeFact(){
       return workTimeFact;
    }


    public void setHoursWorkedWithStaff(BigDecimal aValue){
       hoursWorkedWithStaff = aValue;
    }

    public BigDecimal getHoursWorkedWithStaff(){
       return hoursWorkedWithStaff;
    }


    public void setTimeDelivery(BigDecimal aValue){
       timeDelivery = aValue;
    }

    public BigDecimal getTimeDelivery(){
       return timeDelivery;
    }


    public void setHoursWorkedPlan(BigDecimal aValue){
       hoursWorkedPlan = aValue;
    }

    public BigDecimal getHoursWorkedPlan(){
       return hoursWorkedPlan;
    }


    public void setHoursWorkedNotPlan(BigDecimal aValue){
       hoursWorkedNotPlan = aValue;
    }

    public BigDecimal getHoursWorkedNotPlan(){
       return hoursWorkedNotPlan;
    }


    public void setHoursWorkedSum(BigDecimal aValue){
       hoursWorkedSum = aValue;
    }

    public BigDecimal getHoursWorkedSum(){
       return hoursWorkedSum;
    }


    public void setPercentLoadWork(BigDecimal aValue){
       percentLoadWork = aValue;
    }

    public BigDecimal getPercentLoadWork(){
       return percentLoadWork;
    }


    public void setPercentLoadByPlanWork(BigDecimal aValue){
       percentLoadByPlanWork = aValue;
    }

    public BigDecimal getPercentLoadByPlanWork(){
       return percentLoadByPlanWork;
    }


    public void setPercentLoadByNotPlanWork(BigDecimal aValue){
       percentLoadByNotPlanWork = aValue;
    }

    public BigDecimal getPercentLoadByNotPlanWork(){
       return percentLoadByNotPlanWork;
    }


    public void setPercentBonus(BigDecimal aValue){
       percentBonus = aValue;
    }

    public BigDecimal getPercentBonus(){
       return percentBonus;
    }


    public void setCoefficient(BigDecimal aValue){
       coefficient = aValue;
    }

    public BigDecimal getCoefficient(){
       return coefficient;
    }


    public void setPercentBonusForCharging(BigDecimal aValue){
       percentBonusForCharging = aValue;
    }

    public BigDecimal getPercentBonusForCharging(){
       return percentBonusForCharging;
    }


    public void setCountFactWorkedDays(BigDecimal aValue){
       countFactWorkedDays = aValue;
    }

    public BigDecimal getCountFactWorkedDays(){
       return countFactWorkedDays;
    }


    public void setTradeCategoryId(String aValue){
       tradeCategoryId = aValue;
    }

    public String getTradeCategoryId(){
       return tradeCategoryId;
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


    public void setNoWayOutFromPeriod(BigDecimal aValue){
       noWayOutFromPeriod = aValue;
    }

    public BigDecimal getNoWayOutFromPeriod(){
       return noWayOutFromPeriod;
    }


    public void setSummaCompensation(BigDecimal aValue){
       summaCompensation = aValue;
    }

    public BigDecimal getSummaCompensation(){
       return summaCompensation;
    }


    public void setCoefficientQuality(BigDecimal aValue){
       coefficientQuality = aValue;
    }

    public BigDecimal getCoefficientQuality(){
       return coefficientQuality;
    }


    public void setUserAdd(String aValue){
       userAdd = aValue;
    }

    public String getUserAdd(){
       return userAdd;
    }


    public void setDateAdd(Date aValue){
       dateAdd = aValue;
    }

    public Date getDateAdd(){
       return dateAdd;
    }


    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }


    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }


    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }


    public void setReasonInvalid(String aValue){
       reasonInvalid = aValue;
    }

    public String getReasonInvalid(){
       return reasonInvalid;
    }


    public void setUserSetInvalid(String aValue){
       userSetInvalid = aValue;
    }

    public String getUserSetInvalid(){
       return userSetInvalid;
    }


    public void setDateSetInvalid(Date aValue){
       dateSetInvalid = aValue;
    }

    public Date getDateSetInvalid(){
       return dateSetInvalid;
    }

    public void setBonusList(ENBonusListRef aValue){
       bonusList = aValue;
    }

    public ENBonusListRef getBonusList(){
       return bonusList;
    }
    public void setStatus(ENBonusListItemStatusRef aValue){
       status = aValue;
    }

    public ENBonusListItemStatusRef getStatus(){
       return status;
    }

} // end of ENBonusListItemValueObject


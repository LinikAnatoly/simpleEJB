
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPlanWorkItem2Humen;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENHumenItemKindRef;
    import  com.ksoe.energynet.valueobject.references.ENPlanWorkItemRef;
    import  com.ksoe.techcard.valueobject.references.TKClassificationTypeRef;
    import  com.ksoe.energynet.valueobject.references.FINChargeTypeRef;
    import  com.ksoe.techcard.valueobject.references.TKPositionRef;
    import  com.ksoe.techcard.valueobject.references.TKTransportRef;

public class ENPlanWorkItem2Humen implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE;
    public int  orederNum = Integer.MIN_VALUE;
    public String  tabNumber; 
    public String  fio; 
    public BigDecimal  salary; 
    public BigDecimal  timeMonth; 
    public BigDecimal  daysMonth; 
    public BigDecimal  salaryHours; 
    public BigDecimal  timeWork; 
    public BigDecimal  timeObjectWork; 
    public BigDecimal  timeWorkFact; 
    public BigDecimal  timeDelivery; 
    public BigDecimal  paysWork; 
    public BigDecimal  bonus; 
    public BigDecimal  salaryHoursBonus; 
    public BigDecimal  paysWorkBonus; 
    public BigDecimal  chargePercent; 
    public BigDecimal  chargeSum; 
    public String  balans; 
    public String  podrcod; 
    public BigDecimal  costDelivery; 
    public BigDecimal  generalExpenses; 
    public BigDecimal  administrativeExpenses; 
    public String  cehId; 
    public BigDecimal  percentSurcharge; 
    public BigDecimal  salaryHoursSurcharge; 
    public BigDecimal  paysWorkSurcharge; 
    public BigDecimal  percentPremium; 
    public BigDecimal  salaryHoursPremium; 
    public BigDecimal  paysWorkPremium; 
    public BigDecimal  percentAdditional; 
    public BigDecimal  salaryHoursAdditional; 
    public BigDecimal  paysWorkAdditional; 
    public BigDecimal  paysWorkWithAllSurcharge; 
    public BigDecimal  paysWorkWithAllSurchargeWithoutDeliv; 
    public BigDecimal  paysWorkBonusWithoutDeliv; 
    public BigDecimal  paysWorkSurchargeWithoutDeliv; 
    public BigDecimal  paysWorkPremiumWithoutDeliv; 
    public BigDecimal  paysWorkAdditionalWithoutDeliv; 
    public BigDecimal  chargeSumWithoutDeliv; 
    public long  modify_time = Long.MIN_VALUE;
    public ENHumenItemKindRef humenKindRef = new ENHumenItemKindRef();
    public ENPlanWorkItemRef plaItemRef = new ENPlanWorkItemRef();
    public TKClassificationTypeRef classificationTypeRef = new TKClassificationTypeRef();
    public FINChargeTypeRef chargeRef = new FINChargeTypeRef();
    public TKPositionRef positionRef = new TKPositionRef();
    public TKTransportRef transport = new TKTransportRef();
    public static final String tableName = "ENPLANWORKITEM2HUMEN";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPLANWORKITEM2HUMEN.CODE";
    public static final String orederNum_Attr = "orederNum";
    public static final String orederNum_Field = "OREDERNUM";
    public static final String orederNum_QFielld = "ENPLANWORKITEM2HUMEN.OREDERNUM";
    public static final String tabNumber_Attr = "tabNumber";
    public static final String tabNumber_Field = "TABNUMBER";
    public static final String tabNumber_QFielld = "ENPLANWORKITEM2HUMEN.TABNUMBER";
    public static final String fio_Attr = "fio";
    public static final String fio_Field = "FIO";
    public static final String fio_QFielld = "ENPLANWORKITEM2HUMEN.FIO";
    public static final String salary_Attr = "salary";
    public static final String salary_Field = "SALARY";
    public static final String salary_QFielld = "ENPLANWORKITEM2HUMEN.SALARY";
    public static final String timeMonth_Attr = "timeMonth";
    public static final String timeMonth_Field = "TIMEMONTH";
    public static final String timeMonth_QFielld = "ENPLANWORKITEM2HUMEN.TIMEMONTH";
    public static final String daysMonth_Attr = "daysMonth";
    public static final String daysMonth_Field = "DAYSMONTH";
    public static final String daysMonth_QFielld = "ENPLANWORKITEM2HUMEN.DAYSMONTH";
    public static final String salaryHours_Attr = "salaryHours";
    public static final String salaryHours_Field = "SALARYHOURS";
    public static final String salaryHours_QFielld = "ENPLANWORKITEM2HUMEN.SALARYHOURS";
    public static final String timeWork_Attr = "timeWork";
    public static final String timeWork_Field = "TIMEWORK";
    public static final String timeWork_QFielld = "ENPLANWORKITEM2HUMEN.TIMEWORK";
    public static final String timeObjectWork_Attr = "timeObjectWork";
    public static final String timeObjectWork_Field = "TIMEOBJECTWORK";
    public static final String timeObjectWork_QFielld = "ENPLANWORKITEM2HUMEN.TIMEOBJECTWORK";
    public static final String timeWorkFact_Attr = "timeWorkFact";
    public static final String timeWorkFact_Field = "TIMEWORKFACT";
    public static final String timeWorkFact_QFielld = "ENPLANWORKITEM2HUMEN.TIMEWORKFACT";
    public static final String timeDelivery_Attr = "timeDelivery";
    public static final String timeDelivery_Field = "TIMEDELIVERY";
    public static final String timeDelivery_QFielld = "ENPLANWORKITEM2HUMEN.TIMEDELIVERY";
    public static final String paysWork_Attr = "paysWork";
    public static final String paysWork_Field = "PAYSWORK";
    public static final String paysWork_QFielld = "ENPLANWORKITEM2HUMEN.PAYSWORK";
    public static final String bonus_Attr = "bonus";
    public static final String bonus_Field = "BONUS";
    public static final String bonus_QFielld = "ENPLANWORKITEM2HUMEN.BONUS";
    public static final String salaryHoursBonus_Attr = "salaryHoursBonus";
    public static final String salaryHoursBonus_Field = "SALARYHOURSBONUS";
    public static final String salaryHoursBonus_QFielld = "ENPLANWORKITEM2HUMEN.SALARYHOURSBONUS";
    public static final String paysWorkBonus_Attr = "paysWorkBonus";
    public static final String paysWorkBonus_Field = "PAYSWORKBONUS";
    public static final String paysWorkBonus_QFielld = "ENPLANWORKITEM2HUMEN.PAYSWORKBONUS";
    public static final String chargePercent_Attr = "chargePercent";
    public static final String chargePercent_Field = "CHARGEPERCENT";
    public static final String chargePercent_QFielld = "ENPLANWORKITEM2HUMEN.CHARGEPERCENT";
    public static final String chargeSum_Attr = "chargeSum";
    public static final String chargeSum_Field = "CHARGESUM";
    public static final String chargeSum_QFielld = "ENPLANWORKITEM2HUMEN.CHARGESUM";
    public static final String balans_Attr = "balans";
    public static final String balans_Field = "BALANS";
    public static final String balans_QFielld = "ENPLANWORKITEM2HUMEN.BALANS";
    public static final String podrcod_Attr = "podrcod";
    public static final String podrcod_Field = "PODRCOD";
    public static final String podrcod_QFielld = "ENPLANWORKITEM2HUMEN.PODRCOD";
    public static final String costDelivery_Attr = "costDelivery";
    public static final String costDelivery_Field = "COSTDELIVERY";
    public static final String costDelivery_QFielld = "ENPLANWORKITEM2HUMEN.COSTDELIVERY";
    public static final String generalExpenses_Attr = "generalExpenses";
    public static final String generalExpenses_Field = "GENERALEXPENSES";
    public static final String generalExpenses_QFielld = "ENPLANWORKITEM2HUMEN.GENERALEXPENSES";
    public static final String administrativeExpenses_Attr = "administrativeExpenses";
    public static final String administrativeExpenses_Field = "ADMINISTRATIVEEXPENSES";
    public static final String administrativeExpenses_QFielld = "ENPLANWORKITEM2HUMEN.ADMINISTRATIVEEXPENSES";
    public static final String cehId_Attr = "cehId";
    public static final String cehId_Field = "CEHID";
    public static final String cehId_QFielld = "ENPLANWORKITEM2HUMEN.CEHID";
    public static final String percentSurcharge_Attr = "percentSurcharge";
    public static final String percentSurcharge_Field = "PERCENTSURCHARGE";
    public static final String percentSurcharge_QFielld = "ENPLANWORKITEM2HUMEN.PERCENTSURCHARGE";
    public static final String salaryHoursSurcharge_Attr = "salaryHoursSurcharge";
    public static final String salaryHoursSurcharge_Field = "SALARYHOURSSURCHARGE";
    public static final String salaryHoursSurcharge_QFielld = "ENPLANWORKITEM2HUMEN.SALARYHOURSSURCHARGE";
    public static final String paysWorkSurcharge_Attr = "paysWorkSurcharge";
    public static final String paysWorkSurcharge_Field = "PAYSWORKSURCHARGE";
    public static final String paysWorkSurcharge_QFielld = "ENPLANWORKITEM2HUMEN.PAYSWORKSURCHARGE";
    public static final String percentPremium_Attr = "percentPremium";
    public static final String percentPremium_Field = "PERCENTPREMIUM";
    public static final String percentPremium_QFielld = "ENPLANWORKITEM2HUMEN.PERCENTPREMIUM";
    public static final String salaryHoursPremium_Attr = "salaryHoursPremium";
    public static final String salaryHoursPremium_Field = "SALARYHOURSPREMIUM";
    public static final String salaryHoursPremium_QFielld = "ENPLANWORKITEM2HUMEN.SALARYHOURSPREMIUM";
    public static final String paysWorkPremium_Attr = "paysWorkPremium";
    public static final String paysWorkPremium_Field = "PAYSWORKPREMIUM";
    public static final String paysWorkPremium_QFielld = "ENPLANWORKITEM2HUMEN.PAYSWORKPREMIUM";
    public static final String percentAdditional_Attr = "percentAdditional";
    public static final String percentAdditional_Field = "PERCENTADDITIONAL";
    public static final String percentAdditional_QFielld = "ENPLANWORKITEM2HUMEN.PERCENTADDITIONAL";
    public static final String salaryHoursAdditional_Attr = "salaryHoursAdditional";
    public static final String salaryHoursAdditional_Field = "SALARYHOURSADDITIONAL";
    public static final String salaryHoursAdditional_QFielld = "ENPLANWORKITEM2HUMEN.SALARYHOURSADDITIONAL";
    public static final String paysWorkAdditional_Attr = "paysWorkAdditional";
    public static final String paysWorkAdditional_Field = "PAYSWORKADDITIONAL";
    public static final String paysWorkAdditional_QFielld = "ENPLANWORKITEM2HUMEN.PAYSWORKADDITIONAL";
    public static final String paysWorkWithAllSurcharge_Attr = "paysWorkWithAllSurcharge";
    public static final String paysWorkWithAllSurcharge_Field = "PAYSWORKWITHALLSURCHARGE";
    public static final String paysWorkWithAllSurcharge_QFielld = "ENPLANWORKITEM2HUMEN.PAYSWORKWITHALLSURCHRG";
    public static final String paysWorkWithAllSurchargeWithoutDeliv_Attr = "paysWorkWithAllSurchargeWithoutDeliv";
    public static final String paysWorkWithAllSurchargeWithoutDeliv_Field = "PAYSWORKWITHALLSURCHARGEWITHOUTDELIV";
    public static final String paysWorkWithAllSurchargeWithoutDeliv_QFielld = "ENPLANWORKITEM2HUMEN.PSWRKWTHLLSRCHRGWTHTDL";
    public static final String paysWorkBonusWithoutDeliv_Attr = "paysWorkBonusWithoutDeliv";
    public static final String paysWorkBonusWithoutDeliv_Field = "PAYSWORKBONUSWITHOUTDELIV";
    public static final String paysWorkBonusWithoutDeliv_QFielld = "ENPLANWORKITEM2HUMEN.PAYSWORKBONUSWITHOTDLV";
    public static final String paysWorkSurchargeWithoutDeliv_Attr = "paysWorkSurchargeWithoutDeliv";
    public static final String paysWorkSurchargeWithoutDeliv_Field = "PAYSWORKSURCHARGEWITHOUTDELIV";
    public static final String paysWorkSurchargeWithoutDeliv_QFielld = "ENPLANWORKITEM2HUMEN.PAYSWORKSURCHRGWTHTDLV";
    public static final String paysWorkPremiumWithoutDeliv_Attr = "paysWorkPremiumWithoutDeliv";
    public static final String paysWorkPremiumWithoutDeliv_Field = "PAYSWORKPREMIUMWITHOUTDELIV";
    public static final String paysWorkPremiumWithoutDeliv_QFielld = "ENPLANWORKITEM2HUMEN.PAYSWORKPREMIUMWTHTDLV";
    public static final String paysWorkAdditionalWithoutDeliv_Attr = "paysWorkAdditionalWithoutDeliv";
    public static final String paysWorkAdditionalWithoutDeliv_Field = "PAYSWORKADDITIONALWITHOUTDELIV";
    public static final String paysWorkAdditionalWithoutDeliv_QFielld = "ENPLANWORKITEM2HUMEN.PAYSWORKADDITNLWTHTDLV";
    public static final String chargeSumWithoutDeliv_Attr = "chargeSumWithoutDeliv";
    public static final String chargeSumWithoutDeliv_Field = "CHARGESUMWITHOUTDELIV";
    public static final String chargeSumWithoutDeliv_QFielld = "ENPLANWORKITEM2HUMEN.CHARGESUMWITHOUTDELIV";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENPLANWORKITEM2HUMEN.MODIFY_TIME";
    public static final String humenKindRef_Attr = "humenKindRef";
    public static final String humenKindRef_Field = "HUMENKINDREFCODE";
    public static final String  humenKindRef_QFielld = "ENPLANWORKITEM2HUMEN.HUMENKINDREFCODE";
    public static final String plaItemRef_Attr = "plaItemRef";
    public static final String plaItemRef_Field = "PLAITEMREFCODE";
    public static final String  plaItemRef_QFielld = "ENPLANWORKITEM2HUMEN.PLAITEMREFCODE";
    public static final String classificationTypeRef_Attr = "classificationTypeRef";
    public static final String classificationTypeRef_Field = "CLASSIFICATIONTYPERFCD";
    public static final String  classificationTypeRef_QFielld = "ENPLANWORKITEM2HUMEN.CLASSIFICATIONTYPERFCD";
    public static final String chargeRef_Attr = "chargeRef";
    public static final String chargeRef_Field = "CHARGEREFCODE";
    public static final String  chargeRef_QFielld = "ENPLANWORKITEM2HUMEN.CHARGEREFCODE";
    public static final String positionRef_Attr = "positionRef";
    public static final String positionRef_Field = "POSITIONREFCODE";
    public static final String  positionRef_QFielld = "ENPLANWORKITEM2HUMEN.POSITIONREFCODE";
    public static final String transport_Attr = "transport";
    public static final String transport_Field = "TRANSPORTCODE";
    public static final String  transport_QFielld = "ENPLANWORKITEM2HUMEN.TRANSPORTCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setOrederNum(int aValue){
       orederNum = aValue;
    }

    public int getOrederNum(){
       return orederNum;
    }


    public void setTabNumber(String aValue){
       tabNumber = aValue;
    }

    public String getTabNumber(){
       return tabNumber;
    }


    public void setFio(String aValue){
       fio = aValue;
    }

    public String getFio(){
       return fio;
    }


    public void setSalary(BigDecimal aValue){
       salary = aValue;
    }

    public BigDecimal getSalary(){
       return salary;
    }


    public void setTimeMonth(BigDecimal aValue){
       timeMonth = aValue;
    }

    public BigDecimal getTimeMonth(){
       return timeMonth;
    }


    public void setDaysMonth(BigDecimal aValue){
       daysMonth = aValue;
    }

    public BigDecimal getDaysMonth(){
       return daysMonth;
    }


    public void setSalaryHours(BigDecimal aValue){
       salaryHours = aValue;
    }

    public BigDecimal getSalaryHours(){
       return salaryHours;
    }


    public void setTimeWork(BigDecimal aValue){
       timeWork = aValue;
    }

    public BigDecimal getTimeWork(){
       return timeWork;
    }


    public void setTimeObjectWork(BigDecimal aValue){
       timeObjectWork = aValue;
    }

    public BigDecimal getTimeObjectWork(){
       return timeObjectWork;
    }


    public void setTimeWorkFact(BigDecimal aValue){
       timeWorkFact = aValue;
    }

    public BigDecimal getTimeWorkFact(){
       return timeWorkFact;
    }


    public void setTimeDelivery(BigDecimal aValue){
       timeDelivery = aValue;
    }

    public BigDecimal getTimeDelivery(){
       return timeDelivery;
    }


    public void setPaysWork(BigDecimal aValue){
       paysWork = aValue;
    }

    public BigDecimal getPaysWork(){
       return paysWork;
    }


    public void setBonus(BigDecimal aValue){
       bonus = aValue;
    }

    public BigDecimal getBonus(){
       return bonus;
    }


    public void setSalaryHoursBonus(BigDecimal aValue){
       salaryHoursBonus = aValue;
    }

    public BigDecimal getSalaryHoursBonus(){
       return salaryHoursBonus;
    }


    public void setPaysWorkBonus(BigDecimal aValue){
       paysWorkBonus = aValue;
    }

    public BigDecimal getPaysWorkBonus(){
       return paysWorkBonus;
    }


    public void setChargePercent(BigDecimal aValue){
       chargePercent = aValue;
    }

    public BigDecimal getChargePercent(){
       return chargePercent;
    }


    public void setChargeSum(BigDecimal aValue){
       chargeSum = aValue;
    }

    public BigDecimal getChargeSum(){
       return chargeSum;
    }


    public void setBalans(String aValue){
       balans = aValue;
    }

    public String getBalans(){
       return balans;
    }


    public void setPodrcod(String aValue){
       podrcod = aValue;
    }

    public String getPodrcod(){
       return podrcod;
    }


    public void setCostDelivery(BigDecimal aValue){
       costDelivery = aValue;
    }

    public BigDecimal getCostDelivery(){
       return costDelivery;
    }


    public void setGeneralExpenses(BigDecimal aValue){
       generalExpenses = aValue;
    }

    public BigDecimal getGeneralExpenses(){
       return generalExpenses;
    }


    public void setAdministrativeExpenses(BigDecimal aValue){
       administrativeExpenses = aValue;
    }

    public BigDecimal getAdministrativeExpenses(){
       return administrativeExpenses;
    }


    public void setCehId(String aValue){
       cehId = aValue;
    }

    public String getCehId(){
       return cehId;
    }


    public void setPercentSurcharge(BigDecimal aValue){
       percentSurcharge = aValue;
    }

    public BigDecimal getPercentSurcharge(){
       return percentSurcharge;
    }


    public void setSalaryHoursSurcharge(BigDecimal aValue){
       salaryHoursSurcharge = aValue;
    }

    public BigDecimal getSalaryHoursSurcharge(){
       return salaryHoursSurcharge;
    }


    public void setPaysWorkSurcharge(BigDecimal aValue){
       paysWorkSurcharge = aValue;
    }

    public BigDecimal getPaysWorkSurcharge(){
       return paysWorkSurcharge;
    }


    public void setPercentPremium(BigDecimal aValue){
       percentPremium = aValue;
    }

    public BigDecimal getPercentPremium(){
       return percentPremium;
    }


    public void setSalaryHoursPremium(BigDecimal aValue){
       salaryHoursPremium = aValue;
    }

    public BigDecimal getSalaryHoursPremium(){
       return salaryHoursPremium;
    }


    public void setPaysWorkPremium(BigDecimal aValue){
       paysWorkPremium = aValue;
    }

    public BigDecimal getPaysWorkPremium(){
       return paysWorkPremium;
    }


    public void setPercentAdditional(BigDecimal aValue){
       percentAdditional = aValue;
    }

    public BigDecimal getPercentAdditional(){
       return percentAdditional;
    }


    public void setSalaryHoursAdditional(BigDecimal aValue){
       salaryHoursAdditional = aValue;
    }

    public BigDecimal getSalaryHoursAdditional(){
       return salaryHoursAdditional;
    }


    public void setPaysWorkAdditional(BigDecimal aValue){
       paysWorkAdditional = aValue;
    }

    public BigDecimal getPaysWorkAdditional(){
       return paysWorkAdditional;
    }


    public void setPaysWorkWithAllSurcharge(BigDecimal aValue){
       paysWorkWithAllSurcharge = aValue;
    }

    public BigDecimal getPaysWorkWithAllSurcharge(){
       return paysWorkWithAllSurcharge;
    }


    public void setPaysWorkWithAllSurchargeWithoutDeliv(BigDecimal aValue){
       paysWorkWithAllSurchargeWithoutDeliv = aValue;
    }

    public BigDecimal getPaysWorkWithAllSurchargeWithoutDeliv(){
       return paysWorkWithAllSurchargeWithoutDeliv;
    }


    public void setPaysWorkBonusWithoutDeliv(BigDecimal aValue){
       paysWorkBonusWithoutDeliv = aValue;
    }

    public BigDecimal getPaysWorkBonusWithoutDeliv(){
       return paysWorkBonusWithoutDeliv;
    }


    public void setPaysWorkSurchargeWithoutDeliv(BigDecimal aValue){
       paysWorkSurchargeWithoutDeliv = aValue;
    }

    public BigDecimal getPaysWorkSurchargeWithoutDeliv(){
       return paysWorkSurchargeWithoutDeliv;
    }


    public void setPaysWorkPremiumWithoutDeliv(BigDecimal aValue){
       paysWorkPremiumWithoutDeliv = aValue;
    }

    public BigDecimal getPaysWorkPremiumWithoutDeliv(){
       return paysWorkPremiumWithoutDeliv;
    }


    public void setPaysWorkAdditionalWithoutDeliv(BigDecimal aValue){
       paysWorkAdditionalWithoutDeliv = aValue;
    }

    public BigDecimal getPaysWorkAdditionalWithoutDeliv(){
       return paysWorkAdditionalWithoutDeliv;
    }


    public void setChargeSumWithoutDeliv(BigDecimal aValue){
       chargeSumWithoutDeliv = aValue;
    }

    public BigDecimal getChargeSumWithoutDeliv(){
       return chargeSumWithoutDeliv;
    }


    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setHumenKindRef(ENHumenItemKindRef aValue){
       humenKindRef = aValue;
    }

    public ENHumenItemKindRef getHumenKindRef(){
       return humenKindRef;
    }
    public void setPlaItemRef(ENPlanWorkItemRef aValue){
       plaItemRef = aValue;
    }

    public ENPlanWorkItemRef getPlaItemRef(){
       return plaItemRef;
    }
    public void setClassificationTypeRef(TKClassificationTypeRef aValue){
       classificationTypeRef = aValue;
    }

    public TKClassificationTypeRef getClassificationTypeRef(){
       return classificationTypeRef;
    }
    public void setChargeRef(FINChargeTypeRef aValue){
       chargeRef = aValue;
    }

    public FINChargeTypeRef getChargeRef(){
       return chargeRef;
    }
    public void setPositionRef(TKPositionRef aValue){
       positionRef = aValue;
    }

    public TKPositionRef getPositionRef(){
       return positionRef;
    }
    public void setTransport(TKTransportRef aValue){
       transport = aValue;
    }

    public TKTransportRef getTransport(){
       return transport;
    }

} // end of ENPlanWorkItem2HumenValueObject


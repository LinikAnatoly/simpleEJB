
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENAct2Humen;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENHumenItemKindRef;
    import  com.ksoe.energynet.valueobject.references.ENActRef;
    import  com.ksoe.energynet.valueobject.references.FINChargeTypeRef;
    import  com.ksoe.energynet.valueobject.references.ENPlanWorkRef;

public class ENAct2Humen implements Serializable {

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
    public String  cehId; 
    public long  modify_time = Long.MIN_VALUE;
    public BigDecimal  payWorkCou; 
    public ENHumenItemKindRef humenKindRef = new ENHumenItemKindRef();
    public ENActRef actRef = new ENActRef();
    public FINChargeTypeRef chargeRef = new FINChargeTypeRef();
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public static final String tableName = "ENACT2HUMEN";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACT2HUMEN.CODE";
    public static final String orederNum_Attr = "orederNum";
    public static final String orederNum_Field = "OREDERNUM";
    public static final String orederNum_QFielld = "ENACT2HUMEN.OREDERNUM";
    public static final String tabNumber_Attr = "tabNumber";
    public static final String tabNumber_Field = "TABNUMBER";
    public static final String tabNumber_QFielld = "ENACT2HUMEN.TABNUMBER";
    public static final String fio_Attr = "fio";
    public static final String fio_Field = "FIO";
    public static final String fio_QFielld = "ENACT2HUMEN.FIO";
    public static final String salary_Attr = "salary";
    public static final String salary_Field = "SALARY";
    public static final String salary_QFielld = "ENACT2HUMEN.SALARY";
    public static final String timeMonth_Attr = "timeMonth";
    public static final String timeMonth_Field = "TIMEMONTH";
    public static final String timeMonth_QFielld = "ENACT2HUMEN.TIMEMONTH";
    public static final String daysMonth_Attr = "daysMonth";
    public static final String daysMonth_Field = "DAYSMONTH";
    public static final String daysMonth_QFielld = "ENACT2HUMEN.DAYSMONTH";
    public static final String salaryHours_Attr = "salaryHours";
    public static final String salaryHours_Field = "SALARYHOURS";
    public static final String salaryHours_QFielld = "ENACT2HUMEN.SALARYHOURS";
    public static final String timeWork_Attr = "timeWork";
    public static final String timeWork_Field = "TIMEWORK";
    public static final String timeWork_QFielld = "ENACT2HUMEN.TIMEWORK";
    public static final String timeObjectWork_Attr = "timeObjectWork";
    public static final String timeObjectWork_Field = "TIMEOBJECTWORK";
    public static final String timeObjectWork_QFielld = "ENACT2HUMEN.TIMEOBJECTWORK";
    public static final String timeWorkFact_Attr = "timeWorkFact";
    public static final String timeWorkFact_Field = "TIMEWORKFACT";
    public static final String timeWorkFact_QFielld = "ENACT2HUMEN.TIMEWORKFACT";
    public static final String timeDelivery_Attr = "timeDelivery";
    public static final String timeDelivery_Field = "TIMEDELIVERY";
    public static final String timeDelivery_QFielld = "ENACT2HUMEN.TIMEDELIVERY";
    public static final String paysWork_Attr = "paysWork";
    public static final String paysWork_Field = "PAYSWORK";
    public static final String paysWork_QFielld = "ENACT2HUMEN.PAYSWORK";
    public static final String bonus_Attr = "bonus";
    public static final String bonus_Field = "BONUS";
    public static final String bonus_QFielld = "ENACT2HUMEN.BONUS";
    public static final String salaryHoursBonus_Attr = "salaryHoursBonus";
    public static final String salaryHoursBonus_Field = "SALARYHOURSBONUS";
    public static final String salaryHoursBonus_QFielld = "ENACT2HUMEN.SALARYHOURSBONUS";
    public static final String paysWorkBonus_Attr = "paysWorkBonus";
    public static final String paysWorkBonus_Field = "PAYSWORKBONUS";
    public static final String paysWorkBonus_QFielld = "ENACT2HUMEN.PAYSWORKBONUS";
    public static final String chargePercent_Attr = "chargePercent";
    public static final String chargePercent_Field = "CHARGEPERCENT";
    public static final String chargePercent_QFielld = "ENACT2HUMEN.CHARGEPERCENT";
    public static final String chargeSum_Attr = "chargeSum";
    public static final String chargeSum_Field = "CHARGESUM";
    public static final String chargeSum_QFielld = "ENACT2HUMEN.CHARGESUM";
    public static final String balans_Attr = "balans";
    public static final String balans_Field = "BALANS";
    public static final String balans_QFielld = "ENACT2HUMEN.BALANS";
    public static final String podrcod_Attr = "podrcod";
    public static final String podrcod_Field = "PODRCOD";
    public static final String podrcod_QFielld = "ENACT2HUMEN.PODRCOD";
    public static final String cehId_Attr = "cehId";
    public static final String cehId_Field = "CEHID";
    public static final String cehId_QFielld = "ENACT2HUMEN.CEHID";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENACT2HUMEN.MODIFY_TIME";
    public static final String payWorkCou_Attr = "payWorkCou";
    public static final String payWorkCou_Field = "PAYWORKCOU";
    public static final String payWorkCou_QFielld = "ENACT2HUMEN.PAYWORKCOU";
    public static final String humenKindRef_Attr = "humenKindRef";
    public static final String humenKindRef_Field = "HUMENKINDREFCODE";
    public static final String  humenKindRef_QFielld = "ENACT2HUMEN.HUMENKINDREFCODE";
    public static final String actRef_Attr = "actRef";
    public static final String actRef_Field = "ACTREFCODE";
    public static final String  actRef_QFielld = "ENACT2HUMEN.ACTREFCODE";
    public static final String chargeRef_Attr = "chargeRef";
    public static final String chargeRef_Field = "CHARGEREFCODE";
    public static final String  chargeRef_QFielld = "ENACT2HUMEN.CHARGEREFCODE";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENACT2HUMEN.PLANREFCODE";



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


    public void setCehId(String aValue){
       cehId = aValue;
    }

    public String getCehId(){
       return cehId;
    }


    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }


    public void setPayWorkCou(BigDecimal aValue){
       payWorkCou = aValue;
    }

    public BigDecimal getPayWorkCou(){
       return payWorkCou;
    }

    public void setHumenKindRef(ENHumenItemKindRef aValue){
       humenKindRef = aValue;
    }

    public ENHumenItemKindRef getHumenKindRef(){
       return humenKindRef;
    }
    public void setActRef(ENActRef aValue){
       actRef = aValue;
    }

    public ENActRef getActRef(){
       return actRef;
    }
    public void setChargeRef(FINChargeTypeRef aValue){
       chargeRef = aValue;
    }

    public FINChargeTypeRef getChargeRef(){
       return chargeRef;
    }
    public void setPlanRef(ENPlanWorkRef aValue){
       planRef = aValue;
    }

    public ENPlanWorkRef getPlanRef(){
       return planRef;
    }

} // end of ENAct2HumenValueObject


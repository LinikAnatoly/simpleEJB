
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENInvestProgram;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.techcard.valueobject.TKMeasurement;
    import  com.ksoe.energynet.valueobject.references.ENElementRef;
    import  com.ksoe.energynet.valueobject.references.ENDepartmentRef;
    import  com.ksoe.energynet.valueobject.references.ENInvestProgramStatusRef;
    import  com.ksoe.energynet.valueobject.references.ENInvestObjectTypeRef;
    import  com.ksoe.energynet.valueobject.references.ENPlanWorkTypeRef;
    import  com.ksoe.energynet.valueobject.references.ENInvestProgramGroupsRef;

public class ENInvestProgram implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public String  itemNumber; 
    public int  yearGen = Integer.MIN_VALUE; 
    public String  commentGen; 
    public BigDecimal  countGen; 
    public BigDecimal  price; 
    public BigDecimal  sumGen; 
    public BigDecimal  quarter1count; 
    public BigDecimal  quarter1sum; 
    public BigDecimal  quarter2count; 
    public BigDecimal  quarter2sum; 
    public BigDecimal  quarter3count; 
    public BigDecimal  quarter3sum; 
    public BigDecimal  quarter4count; 
    public BigDecimal  quarter4sum; 
    public long  modify_time = Long.MIN_VALUE;
    public String  userAdd; 
    public Date dateAdd ;
    public String  userGen; 
    public Date dateEdit ;
    public TKMeasurement measurement = new TKMeasurement();
    public ENElementRef elementRef = new ENElementRef();
    public ENDepartmentRef budgetRef = new ENDepartmentRef();
    public ENInvestProgramStatusRef statusRef = new ENInvestProgramStatusRef();
    public ENInvestObjectTypeRef objectTypeRef = new ENInvestObjectTypeRef();
    public ENPlanWorkTypeRef planTypeRef = new ENPlanWorkTypeRef();
    public ENInvestProgramGroupsRef invGroupRef = new ENInvestProgramGroupsRef();
    public static final String tableName = "ENINVESTPROGRAM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENINVESTPROGRAM.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENINVESTPROGRAM.NAME";
    public static final String itemNumber_Attr = "itemNumber";
    public static final String itemNumber_Field = "ITEMNUMBER";
    public static final String itemNumber_QFielld = "ENINVESTPROGRAM.ITEMNUMBER";
    public static final String yearGen_Attr = "yearGen";
    public static final String yearGen_Field = "YEARGEN";
    public static final String yearGen_QFielld = "ENINVESTPROGRAM.YEARGEN";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENINVESTPROGRAM.COMMENTGEN";
    public static final String countGen_Attr = "countGen";
    public static final String countGen_Field = "COUNTGEN";
    public static final String countGen_QFielld = "ENINVESTPROGRAM.COUNTGEN";
    public static final String price_Attr = "price";
    public static final String price_Field = "PRICE";
    public static final String price_QFielld = "ENINVESTPROGRAM.PRICE";
    public static final String sumGen_Attr = "sumGen";
    public static final String sumGen_Field = "SUMGEN";
    public static final String sumGen_QFielld = "ENINVESTPROGRAM.SUMGEN";
    public static final String quarter1count_Attr = "quarter1count";
    public static final String quarter1count_Field = "QUARTER1COUNT";
    public static final String quarter1count_QFielld = "ENINVESTPROGRAM.QUARTER1COUNT";
    public static final String quarter1sum_Attr = "quarter1sum";
    public static final String quarter1sum_Field = "QUARTER1SUM";
    public static final String quarter1sum_QFielld = "ENINVESTPROGRAM.QUARTER1SUM";
    public static final String quarter2count_Attr = "quarter2count";
    public static final String quarter2count_Field = "QUARTER2COUNT";
    public static final String quarter2count_QFielld = "ENINVESTPROGRAM.QUARTER2COUNT";
    public static final String quarter2sum_Attr = "quarter2sum";
    public static final String quarter2sum_Field = "QUARTER2SUM";
    public static final String quarter2sum_QFielld = "ENINVESTPROGRAM.QUARTER2SUM";
    public static final String quarter3count_Attr = "quarter3count";
    public static final String quarter3count_Field = "QUARTER3COUNT";
    public static final String quarter3count_QFielld = "ENINVESTPROGRAM.QUARTER3COUNT";
    public static final String quarter3sum_Attr = "quarter3sum";
    public static final String quarter3sum_Field = "QUARTER3SUM";
    public static final String quarter3sum_QFielld = "ENINVESTPROGRAM.QUARTER3SUM";
    public static final String quarter4count_Attr = "quarter4count";
    public static final String quarter4count_Field = "QUARTER4COUNT";
    public static final String quarter4count_QFielld = "ENINVESTPROGRAM.QUARTER4COUNT";
    public static final String quarter4sum_Attr = "quarter4sum";
    public static final String quarter4sum_Field = "QUARTER4SUM";
    public static final String quarter4sum_QFielld = "ENINVESTPROGRAM.QUARTER4SUM";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENINVESTPROGRAM.MODIFY_TIME";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "ENINVESTPROGRAM.USERADD";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENINVESTPROGRAM.DATEADD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENINVESTPROGRAM.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENINVESTPROGRAM.DATEEDIT";
    public static final String measurement_Attr = "measurement";
    public static final String measurement_Field = "MEASUREMENTCODE";
    public static final String  measurement_QFielld = "ENINVESTPROGRAM.MEASUREMENTCODE";
    public static final String elementRef_Attr = "elementRef";
    public static final String elementRef_Field = "ELEMENTREFCODE";
    public static final String  elementRef_QFielld = "ENINVESTPROGRAM.ELEMENTREFCODE";
    public static final String budgetRef_Attr = "budgetRef";
    public static final String budgetRef_Field = "BUDGETREFCODE";
    public static final String  budgetRef_QFielld = "ENINVESTPROGRAM.BUDGETREFCODE";
    public static final String statusRef_Attr = "statusRef";
    public static final String statusRef_Field = "STATUSREFCODE";
    public static final String  statusRef_QFielld = "ENINVESTPROGRAM.STATUSREFCODE";
    public static final String objectTypeRef_Attr = "objectTypeRef";
    public static final String objectTypeRef_Field = "OBJECTTYPEREFCODE";
    public static final String  objectTypeRef_QFielld = "ENINVESTPROGRAM.OBJECTTYPEREFCODE";
    public static final String planTypeRef_Attr = "planTypeRef";
    public static final String planTypeRef_Field = "PLANTYPEREFCODE";
    public static final String  planTypeRef_QFielld = "ENINVESTPROGRAM.PLANTYPEREFCODE";
    public static final String invGroupRef_Attr = "invGroupRef";
    public static final String invGroupRef_Field = "INVGROUPREFCODE";
    public static final String  invGroupRef_QFielld = "ENINVESTPROGRAM.INVGROUPREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }

    public void setItemNumber(String aValue){
       itemNumber = aValue;
    }

    public String getItemNumber(){
       return itemNumber;
    }

    public void setYearGen(int aValue){
       yearGen = aValue;
    }

    public int getYearGen(){
       return yearGen;
    }

    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }

    public void setCountGen(BigDecimal aValue){
       countGen = aValue;
    }

    public BigDecimal getCountGen(){
       return countGen;
    }

    public void setPrice(BigDecimal aValue){
       price = aValue;
    }

    public BigDecimal getPrice(){
       return price;
    }

    public void setSumGen(BigDecimal aValue){
       sumGen = aValue;
    }

    public BigDecimal getSumGen(){
       return sumGen;
    }

    public void setQuarter1count(BigDecimal aValue){
       quarter1count = aValue;
    }

    public BigDecimal getQuarter1count(){
       return quarter1count;
    }

    public void setQuarter1sum(BigDecimal aValue){
       quarter1sum = aValue;
    }

    public BigDecimal getQuarter1sum(){
       return quarter1sum;
    }

    public void setQuarter2count(BigDecimal aValue){
       quarter2count = aValue;
    }

    public BigDecimal getQuarter2count(){
       return quarter2count;
    }

    public void setQuarter2sum(BigDecimal aValue){
       quarter2sum = aValue;
    }

    public BigDecimal getQuarter2sum(){
       return quarter2sum;
    }

    public void setQuarter3count(BigDecimal aValue){
       quarter3count = aValue;
    }

    public BigDecimal getQuarter3count(){
       return quarter3count;
    }

    public void setQuarter3sum(BigDecimal aValue){
       quarter3sum = aValue;
    }

    public BigDecimal getQuarter3sum(){
       return quarter3sum;
    }

    public void setQuarter4count(BigDecimal aValue){
       quarter4count = aValue;
    }

    public BigDecimal getQuarter4count(){
       return quarter4count;
    }

    public void setQuarter4sum(BigDecimal aValue){
       quarter4sum = aValue;
    }

    public BigDecimal getQuarter4sum(){
       return quarter4sum;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
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

    public void setMeasurement(TKMeasurement aValue){
       measurement = aValue;
    }

    public TKMeasurement getMeasurement(){
       return measurement;
    }
    public void setElementRef(ENElementRef aValue){
       elementRef = aValue;
    }

    public ENElementRef getElementRef(){
       return elementRef;
    }
    public void setBudgetRef(ENDepartmentRef aValue){
       budgetRef = aValue;
    }

    public ENDepartmentRef getBudgetRef(){
       return budgetRef;
    }
    public void setStatusRef(ENInvestProgramStatusRef aValue){
       statusRef = aValue;
    }

    public ENInvestProgramStatusRef getStatusRef(){
       return statusRef;
    }
    public void setObjectTypeRef(ENInvestObjectTypeRef aValue){
       objectTypeRef = aValue;
    }

    public ENInvestObjectTypeRef getObjectTypeRef(){
       return objectTypeRef;
    }
    public void setPlanTypeRef(ENPlanWorkTypeRef aValue){
       planTypeRef = aValue;
    }

    public ENPlanWorkTypeRef getPlanTypeRef(){
       return planTypeRef;
    }
    public void setInvGroupRef(ENInvestProgramGroupsRef aValue){
       invGroupRef = aValue;
    }

    public ENInvestProgramGroupsRef getInvGroupRef(){
       return invGroupRef;
    }

} // end of ENInvestProgramValueObject


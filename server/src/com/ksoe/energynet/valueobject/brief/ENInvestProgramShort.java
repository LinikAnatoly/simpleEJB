
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENInvestProgram;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENInvestProgramShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String name;
    public String itemNumber;
    public int yearGen = Integer.MIN_VALUE;
    public String commentGen;
    public BigDecimal countGen;
    public BigDecimal price;
    public BigDecimal sumGen;
    public BigDecimal quarter1count;
    public BigDecimal quarter1sum;
    public BigDecimal quarter2count;
    public BigDecimal quarter2sum;
    public BigDecimal quarter3count;
    public BigDecimal quarter3sum;
    public BigDecimal quarter4count;
    public BigDecimal quarter4sum;
    public String userAdd;
    public Date dateAdd ;
    public String userGen;
    public Date dateEdit ;
    public int measurementCode = Integer.MIN_VALUE;
    public String measurementName;
    public int elementRefCode = Integer.MIN_VALUE;
    public int budgetRefCode = Integer.MIN_VALUE;
    public String budgetRefShortName;
    public Date budgetRefDateStart;
    public Date budgetRefDateFinal;
    public int budgetRefRenCode = Integer.MIN_VALUE;
    public String budgetRefShpzBalans;
    public int budgetRefKau_table_id_1884 = Integer.MIN_VALUE;
    public String budgetRefKau_1884;
    public String budgetRefName_1884;
    public int statusRefCode = Integer.MIN_VALUE;
    public String statusRefName;
    public int objectTypeRefCode = Integer.MIN_VALUE;
    public String objectTypeRefName;
    public int planTypeRefCode = Integer.MIN_VALUE;
    public String planTypeRefName;
    public String planTypeRefShortName;
    public int invGroupRefCode = Integer.MIN_VALUE;
    public String invGroupRefName;
    public String invGroupRefCommentgen;

    public String elementRefName;
    public String invNumber;
    
    public String getElementRefName() {
		return elementRefName;
	}

	public void setElementRefName(String elementRefName) {
		this.elementRefName = elementRefName;
	}

	public String getInvNumber() {
		return invNumber;
	}

	public void setInvNumber(String invNumber) {
		this.invNumber = invNumber;
	}

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


    public void setMeasurementCode(int aValue){
       measurementCode = aValue;
    }
    public int getMeasurementCode(){
       return measurementCode;
    }

    public void setMeasurementName(String aValue){
       measurementName = aValue;
    }
    public String getMeasurementName(){
       return measurementName;
    }

    public void setElementRefCode(int aValue){
       elementRefCode = aValue;
    }
    public int getElementRefCode(){
       return elementRefCode;
    }

    public void setBudgetRefCode(int aValue){
       budgetRefCode = aValue;
    }
    public int getBudgetRefCode(){
       return budgetRefCode;
    }

    public void setBudgetRefShortName(String aValue){
       budgetRefShortName = aValue;
    }
    public String getBudgetRefShortName(){
       return budgetRefShortName;
    }


    public void setBudgetRefDateStart(Date aValue){
       budgetRefDateStart = aValue;
    }
    public Date getBudgetRefDateStart(){
       return budgetRefDateStart;
    }


    public void setBudgetRefDateFinal(Date aValue){
       budgetRefDateFinal = aValue;
    }
    public Date getBudgetRefDateFinal(){
       return budgetRefDateFinal;
    }

    public void setBudgetRefRenCode(int aValue){
       budgetRefRenCode = aValue;
    }
    public int getBudgetRefRenCode(){
       return budgetRefRenCode;
    }

    public void setBudgetRefShpzBalans(String aValue){
       budgetRefShpzBalans = aValue;
    }
    public String getBudgetRefShpzBalans(){
       return budgetRefShpzBalans;
    }

    public void setBudgetRefKau_table_id_1884(int aValue){
       budgetRefKau_table_id_1884 = aValue;
    }
    public int getBudgetRefKau_table_id_1884(){
       return budgetRefKau_table_id_1884;
    }

    public void setBudgetRefKau_1884(String aValue){
       budgetRefKau_1884 = aValue;
    }
    public String getBudgetRefKau_1884(){
       return budgetRefKau_1884;
    }

    public void setBudgetRefName_1884(String aValue){
       budgetRefName_1884 = aValue;
    }
    public String getBudgetRefName_1884(){
       return budgetRefName_1884;
    }

    public void setStatusRefCode(int aValue){
       statusRefCode = aValue;
    }
    public int getStatusRefCode(){
       return statusRefCode;
    }

    public void setStatusRefName(String aValue){
       statusRefName = aValue;
    }
    public String getStatusRefName(){
       return statusRefName;
    }

    public void setObjectTypeRefCode(int aValue){
       objectTypeRefCode = aValue;
    }
    public int getObjectTypeRefCode(){
       return objectTypeRefCode;
    }

    public void setObjectTypeRefName(String aValue){
       objectTypeRefName = aValue;
    }
    public String getObjectTypeRefName(){
       return objectTypeRefName;
    }

    public void setPlanTypeRefCode(int aValue){
       planTypeRefCode = aValue;
    }
    public int getPlanTypeRefCode(){
       return planTypeRefCode;
    }

    public void setPlanTypeRefName(String aValue){
       planTypeRefName = aValue;
    }
    public String getPlanTypeRefName(){
       return planTypeRefName;
    }

    public void setPlanTypeRefShortName(String aValue){
       planTypeRefShortName = aValue;
    }
    public String getPlanTypeRefShortName(){
       return planTypeRefShortName;
    }

    public void setInvGroupRefCode(int aValue){
       invGroupRefCode = aValue;
    }
    public int getInvGroupRefCode(){
       return invGroupRefCode;
    }

    public void setInvGroupRefName(String aValue){
       invGroupRefName = aValue;
    }
    public String getInvGroupRefName(){
       return invGroupRefName;
    }

    public void setInvGroupRefCommentgen(String aValue){
       invGroupRefCommentgen = aValue;
    }
    public String getInvGroupRefCommentgen(){
       return invGroupRefCommentgen;
    }



}
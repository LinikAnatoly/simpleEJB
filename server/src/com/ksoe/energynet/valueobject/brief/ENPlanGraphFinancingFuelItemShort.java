
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENPlanGraphFinancingFuelItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENPlanGraphFinancingFuelItemShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal totalSum;
    public BigDecimal sumDekada1;
    public BigDecimal sumDekada2;
    public BigDecimal sumDekada3;
    public BigDecimal countFuelSpent;
    public String userGen;
    public Date dateEdit ;
    public int departmentRefCode = Integer.MIN_VALUE;
    public String departmentRefShortName;
    public Date departmentRefDateStart;
    public Date departmentRefDateFinal;
    public int departmentRefRenCode = Integer.MIN_VALUE;
    public String departmentRefShpzBalans;
    public int departmentRefKau_table_id_1884 = Integer.MIN_VALUE;
    public String departmentRefKau_1884;
    public String departmentRefName_1884;
    public int planGraphRefCode = Integer.MIN_VALUE;
    public int planGraphRefMonthGen = Integer.MIN_VALUE;
    public int planGraphRefYearGen = Integer.MIN_VALUE;
    public BigDecimal planGraphRefTotalSum;
    public BigDecimal planGraphRefKoefDekada1;
    public BigDecimal planGraphRefKoefDekada2;
    public BigDecimal planGraphRefKoefDekada3;
    public BigDecimal planGraphRefCountFuelSpent;
    public String planGraphRefUserGen;
    public Date planGraphRefDateEdit;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setTotalSum(BigDecimal aValue){
       totalSum = aValue;
    }

    public BigDecimal getTotalSum(){
       return totalSum;
    }
    public void setSumDekada1(BigDecimal aValue){
       sumDekada1 = aValue;
    }

    public BigDecimal getSumDekada1(){
       return sumDekada1;
    }
    public void setSumDekada2(BigDecimal aValue){
       sumDekada2 = aValue;
    }

    public BigDecimal getSumDekada2(){
       return sumDekada2;
    }
    public void setSumDekada3(BigDecimal aValue){
       sumDekada3 = aValue;
    }

    public BigDecimal getSumDekada3(){
       return sumDekada3;
    }
    public void setCountFuelSpent(BigDecimal aValue){
       countFuelSpent = aValue;
    }

    public BigDecimal getCountFuelSpent(){
       return countFuelSpent;
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


    public void setDepartmentRefCode(int aValue){
       departmentRefCode = aValue;
    }
    public int getDepartmentRefCode(){
       return departmentRefCode;
    }

    public void setDepartmentRefShortName(String aValue){
       departmentRefShortName = aValue;
    }
    public String getDepartmentRefShortName(){
       return departmentRefShortName;
    }


    public void setDepartmentRefDateStart(Date aValue){
       departmentRefDateStart = aValue;
    }
    public Date getDepartmentRefDateStart(){
       return departmentRefDateStart;
    }


    public void setDepartmentRefDateFinal(Date aValue){
       departmentRefDateFinal = aValue;
    }
    public Date getDepartmentRefDateFinal(){
       return departmentRefDateFinal;
    }

    public void setDepartmentRefRenCode(int aValue){
       departmentRefRenCode = aValue;
    }
    public int getDepartmentRefRenCode(){
       return departmentRefRenCode;
    }

    public void setDepartmentRefShpzBalans(String aValue){
       departmentRefShpzBalans = aValue;
    }
    public String getDepartmentRefShpzBalans(){
       return departmentRefShpzBalans;
    }

    public void setDepartmentRefKau_table_id_1884(int aValue){
       departmentRefKau_table_id_1884 = aValue;
    }
    public int getDepartmentRefKau_table_id_1884(){
       return departmentRefKau_table_id_1884;
    }

    public void setDepartmentRefKau_1884(String aValue){
       departmentRefKau_1884 = aValue;
    }
    public String getDepartmentRefKau_1884(){
       return departmentRefKau_1884;
    }

    public void setDepartmentRefName_1884(String aValue){
       departmentRefName_1884 = aValue;
    }
    public String getDepartmentRefName_1884(){
       return departmentRefName_1884;
    }

    public void setPlanGraphRefCode(int aValue){
       planGraphRefCode = aValue;
    }
    public int getPlanGraphRefCode(){
       return planGraphRefCode;
    }

    public void setPlanGraphRefMonthGen(int aValue){
       planGraphRefMonthGen = aValue;
    }
    public int getPlanGraphRefMonthGen(){
       return planGraphRefMonthGen;
    }

    public void setPlanGraphRefYearGen(int aValue){
       planGraphRefYearGen = aValue;
    }
    public int getPlanGraphRefYearGen(){
       return planGraphRefYearGen;
    }

    public void setPlanGraphRefTotalSum(BigDecimal aValue){
       planGraphRefTotalSum = aValue;
    }
    public BigDecimal getPlanGraphRefTotalSum(){
       return planGraphRefTotalSum;
    }

    public void setPlanGraphRefKoefDekada1(BigDecimal aValue){
       planGraphRefKoefDekada1 = aValue;
    }
    public BigDecimal getPlanGraphRefKoefDekada1(){
       return planGraphRefKoefDekada1;
    }

    public void setPlanGraphRefKoefDekada2(BigDecimal aValue){
       planGraphRefKoefDekada2 = aValue;
    }
    public BigDecimal getPlanGraphRefKoefDekada2(){
       return planGraphRefKoefDekada2;
    }

    public void setPlanGraphRefKoefDekada3(BigDecimal aValue){
       planGraphRefKoefDekada3 = aValue;
    }
    public BigDecimal getPlanGraphRefKoefDekada3(){
       return planGraphRefKoefDekada3;
    }

    public void setPlanGraphRefCountFuelSpent(BigDecimal aValue){
       planGraphRefCountFuelSpent = aValue;
    }
    public BigDecimal getPlanGraphRefCountFuelSpent(){
       return planGraphRefCountFuelSpent;
    }

    public void setPlanGraphRefUserGen(String aValue){
       planGraphRefUserGen = aValue;
    }
    public String getPlanGraphRefUserGen(){
       return planGraphRefUserGen;
    }


    public void setPlanGraphRefDateEdit(Date aValue){
       planGraphRefDateEdit = aValue;
    }
    public Date getPlanGraphRefDateEdit(){
       return planGraphRefDateEdit;
    }



}
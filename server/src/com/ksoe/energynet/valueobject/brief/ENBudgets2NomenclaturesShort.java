
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENBudgets2Nomenclatures;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENBudgets2NomenclaturesShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String nn;
	public String mat_name;
	public int budgetRefCode = Integer.MIN_VALUE;
	public String budgetRefShortName;
	public Date budgetRefDateStart;
	public Date budgetRefDateFinal;
	public int budgetRefRenCode = Integer.MIN_VALUE;
	public String budgetRefShpzBalans;
	public int budgetRefKau_table_id_1884 = Integer.MIN_VALUE;
	public String budgetRefKau_1884;
	public String budgetRefName_1884;
	public String budgetRefHrmorganizationid;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}


	public void setNn(String aValue){
		nn = aValue;
	}

	public String getNn(){
		return nn;
	}

	public void setMat_name(String aValue){
		mat_name = aValue;
	}

	public String getMat_name(){
		return mat_name;
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

	public void setBudgetRefHrmorganizationid(String aValue){
		budgetRefHrmorganizationid = aValue;
	}
	public String getBudgetRefHrmorganizationid(){
		return budgetRefHrmorganizationid;
	}



}
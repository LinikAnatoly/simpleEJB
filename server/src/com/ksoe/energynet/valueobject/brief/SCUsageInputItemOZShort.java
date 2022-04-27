
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for SCUsageInputItemOZ;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class SCUsageInputItemOZShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public String numberDoc;
	public String counterType;
	public String account;
	public BigDecimal cost;
	public int countGen = Integer.MIN_VALUE;
	public int scCode = Integer.MIN_VALUE;
	public int usageInputItemRefCode = Integer.MIN_VALUE;
	public String usageInputItemRefNumberDoc;
	public int usageInputItemRefCountGen = Integer.MIN_VALUE;
	public int usageInputItemRefScCode = Integer.MIN_VALUE;
	
	public int budgetRefCode = Integer.MIN_VALUE;
	public String budgetRefShortName;
	
    public int usageInputItemRefKindCode = Integer.MIN_VALUE;
    public String usageInputItemRefKindName;

    public int getUsageInputItemRefKindCode() {
		return usageInputItemRefKindCode;
	}

	public void setUsageInputItemRefKindCode(int usageInputItemRefKindCode) {
		this.usageInputItemRefKindCode = usageInputItemRefKindCode;
	}


	public String getUsageInputItemRefKindName() {
		return usageInputItemRefKindName;
	}

	public void setUsageInputItemRefKindName(String usageInputItemRefKindName) {
		this.usageInputItemRefKindName = usageInputItemRefKindName;
	}

	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setNumberDoc(String aValue){
		numberDoc = aValue;
	}

	public String getNumberDoc(){
		return numberDoc;
	}


	public void setCounterType(String aValue){
		counterType = aValue;
	}

	public String getCounterType(){
		return counterType;
	}

	public void setAccount(String aValue){
		account = aValue;
	}

	public String getAccount(){
		return account;
	}

	public void setCost(BigDecimal aValue){
		cost = aValue;
	}

	public BigDecimal getCost(){
		return cost;
	}

	public void setCountGen(int aValue){
		countGen = aValue;
	}

	public int getCountGen(){
		return countGen;
	}

	public void setScCode(int aValue){
		scCode = aValue;
	}

	public int getScCode(){
		return scCode;
	}



	public void setUsageInputItemRefCode(int aValue){
		usageInputItemRefCode = aValue;
	}
	public int getUsageInputItemRefCode(){
		return usageInputItemRefCode;
	}

	public void setUsageInputItemRefNumberDoc(String aValue){
		usageInputItemRefNumberDoc = aValue;
	}
	public String getUsageInputItemRefNumberDoc(){
		return usageInputItemRefNumberDoc;
	}

	public void setUsageInputItemRefCountGen(int aValue){
		usageInputItemRefCountGen = aValue;
	}
	public int getUsageInputItemRefCountGen(){
		return usageInputItemRefCountGen;
	}

	public void setUsageInputItemRefScCode(int aValue){
		usageInputItemRefScCode = aValue;
	}
	public int getUsageInputItemRefScCode(){
		return usageInputItemRefScCode;
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
}
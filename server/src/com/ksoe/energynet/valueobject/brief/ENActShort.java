
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENAct;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENActShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String numberGen;
	public Date dateGen ;
	public String finMolCode;
	public String finMolName;
	public String finMechanicName;
	public String invNumber;
	public String userGen;
	public Date dateEdit ;
	public Date dateAct ;
	public String molCodeObject;
	public Boolean checkedByAccountant ;
	public int statusRefCode = Integer.MIN_VALUE;
	public String statusRefName;
	public int elementCode = Integer.MIN_VALUE;
	public int actTypeRefCode = Integer.MIN_VALUE;
	public String actTypeRefName;
	public String actTypeRefShortName;
	public String planWorkTypeName;
	public BigDecimal humanHours;

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

	public void setDateGen(Date aValue){
		dateGen = aValue;
	}

	public Date getDateGen(){
		return dateGen;
	}

	public void setFinMolCode(String aValue){
		finMolCode = aValue;
	}

	public String getFinMolCode(){
		return finMolCode;
	}

	public void setFinMolName(String aValue){
		finMolName = aValue;
	}

	public String getFinMolName(){
		return finMolName;
	}


	public void setFinMechanicName(String aValue){
		finMechanicName = aValue;
	}

	public String getFinMechanicName(){
		return finMechanicName;
	}


	public void setInvNumber(String aValue){
		invNumber = aValue;
	}

	public String getInvNumber(){
		return invNumber;
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



	public void setDateAct(Date aValue){
		dateAct = aValue;
	}

	public Date getDateAct(){
		return dateAct;
	}

	public void setMolCodeObject(String aValue){
		molCodeObject = aValue;
	}

	public String getMolCodeObject(){
		return molCodeObject;
	}

	public void setCheckedByAccountant(Boolean aValue){
		checkedByAccountant = aValue;
	}

	public Boolean getCheckedByAccountant(){
		return checkedByAccountant;
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

	public void setElementCode(int aValue){
		elementCode = aValue;
	}
	public int getElementCode(){
		return elementCode;
	}

	public void setActTypeRefCode(int aValue){
		actTypeRefCode = aValue;
	}
	public int getActTypeRefCode(){
		return actTypeRefCode;
	}

	public void setActTypeRefName(String aValue){
		actTypeRefName = aValue;
	}
	public String getActTypeRefName(){
		return actTypeRefName;
	}

	public void setActTypeRefShortName(String aValue){
		actTypeRefShortName = aValue;
	}
	public String getActTypeRefShortName(){
		return actTypeRefShortName;
	}

	public String getPlanWorkTypeName() {
		return planWorkTypeName;
	}

	public void setPlanWorkTypeName(String planWorkTypeName) {
		this.planWorkTypeName = planWorkTypeName;
	}

	public BigDecimal getHumanHours() {
		return humanHours;
	}

	public void setHumanHours(BigDecimal humanHours) {
		this.humanHours = humanHours;
	}

}

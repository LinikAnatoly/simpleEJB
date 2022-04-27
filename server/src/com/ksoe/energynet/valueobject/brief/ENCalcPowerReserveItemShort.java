
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENCalcPowerReserveItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENCalcPowerReserveItemShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String userGen;
	public Date dateEdit ;
	public int calcPowerReserveRefCode = Integer.MIN_VALUE;
	public String calcPowerReserveRefUserGen;
	public Date calcPowerReserveRefDateEdit;
	public int so2nodeRefCode = Integer.MIN_VALUE;
	public int so2nodeRefCcNodeCode = Integer.MIN_VALUE;
	public BigDecimal so2nodeRefPower;
	public String so2nodeRefDescription;
	public int so2nodeRefIsCalc = Integer.MIN_VALUE;
	public String so2nodeRefUserGen;
	public Date so2nodeRefDateEdit;
	
	public String soContract;
	public String techconditions;
	public String soContragentName;
	public String soName;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
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


	public void setCalcPowerReserveRefCode(int aValue){
		calcPowerReserveRefCode = aValue;
	}
	public int getCalcPowerReserveRefCode(){
		return calcPowerReserveRefCode;
	}

	public void setCalcPowerReserveRefUserGen(String aValue){
		calcPowerReserveRefUserGen = aValue;
	}
	public String getCalcPowerReserveRefUserGen(){
		return calcPowerReserveRefUserGen;
	}

	public void setCalcPowerReserveRefDateEdit(Date aValue){
		calcPowerReserveRefDateEdit = aValue;
	}
	public Date getCalcPowerReserveRefDateEdit(){
		return calcPowerReserveRefDateEdit;
	}

	public void setSo2nodeRefCode(int aValue){
		so2nodeRefCode = aValue;
	}
	public int getSo2nodeRefCode(){
		return so2nodeRefCode;
	}

	public void setSo2nodeRefCcNodeCode(int aValue){
		so2nodeRefCcNodeCode = aValue;
	}
	public int getSo2nodeRefCcNodeCode(){
		return so2nodeRefCcNodeCode;
	}

	public void setSo2nodeRefPower(BigDecimal aValue){
		so2nodeRefPower = aValue;
	}
	public BigDecimal getSo2nodeRefPower(){
		return so2nodeRefPower;
	}

	public void setSo2nodeRefDescription(String aValue){
		so2nodeRefDescription = aValue;
	}
	public String getSo2nodeRefDescription(){
		return so2nodeRefDescription;
	}

	public void setSo2nodeRefIsCalc(int aValue){
		so2nodeRefIsCalc = aValue;
	}
	public int getSo2nodeRefIsCalc(){
		return so2nodeRefIsCalc;
	}

	public void setSo2nodeRefUserGen(String aValue){
		so2nodeRefUserGen = aValue;
	}
	public String getSo2nodeRefUserGen(){
		return so2nodeRefUserGen;
	}

	public void setSo2nodeRefDateEdit(Date aValue){
		so2nodeRefDateEdit = aValue;
	}
	public Date getSo2nodeRefDateEdit(){
		return so2nodeRefDateEdit;
	}

	public String getSoContract() {
		return soContract;
	}

	public void setSoContract(String soContract) {
		this.soContract = soContract;
	}

	public String getTechconditions() {
		return techconditions;
	}

	public void setTechconditions(String techconditions) {
		this.techconditions = techconditions;
	}

	public String getSoContragentName() {
		return soContragentName;
	}

	public void setSoContragentName(String soContragentName) {
		this.soContragentName = soContragentName;
	}
	
	public String getSoName() {
		return soName;
	}

	public void setSoName(String soName) {
		this.soName = soName;
	}



}

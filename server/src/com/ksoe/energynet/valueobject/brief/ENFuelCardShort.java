
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2022 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENFuelCard;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENFuelCardShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String reg_id;
	public String userGen;
	public Date dateEdit ;
	public Date dateApply ;
	public int fuelTypeCode = Integer.MIN_VALUE;
	public String fuelTypeName;
	public int finWorkerCode = Integer.MIN_VALUE;
	public String finWorkerName;
	public String finWorkerTabNumber;
	public String finWorkerPositionName;
	public int finWorkerPositionCode = Integer.MIN_VALUE;
	public String finWorkerDepartmentName;
	public String finWorkerDepartmentCode;
	public BigDecimal finWorkerPriceGen;
	public int finWorkerCategor = Integer.MIN_VALUE;
	public int finWorkerFinCode = Integer.MIN_VALUE;
	public int finWorkerIsSentAssignment = Integer.MIN_VALUE;
	public BigDecimal finWorkerChargePercent;
	public int finWorkerCategorId = Integer.MIN_VALUE;
	public String finWorkerCategorName;
	public String finWorkerWorkTimeId;
	public String finWorkerPositionId;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}

	public String getUserGen() {
		return userGen;
	}

	public void setUserGen(String userGen) {
		this.userGen = userGen;
	}

	public Date getDateEdit() {
		return dateEdit;
	}

	public void setDateEdit(Date dateEdit) {
		this.dateEdit = dateEdit;
	}

	public Date getDateApply() {
		return dateApply;
	}

	public void setDateApply(Date dateApply) {
		this.dateApply = dateApply;
	}


	public int getFuelTypeCode(){
		return fuelTypeCode;
	}

	public void setFuelTypeCode(int fuelTypeCode) {
		this.fuelTypeCode = fuelTypeCode;
	}

	public String getFuelTypeName(){
		return fuelTypeName;
	}

	public void setFuelTypeName(String fuelTypeName) {
		this.fuelTypeName = fuelTypeName;
	}

	public int getFinWorkerCode(){
		return finWorkerCode;
	}

	public void setFinWorkerCode(int finWorkerCode) {
		this.finWorkerCode = finWorkerCode;
	}

	public String getFinWorkerName(){
		return finWorkerName;
	}

	public void setFinWorkerName(String finWorkerName) {
		this.finWorkerName = finWorkerName;
	}

	public String getFinWorkerTabNumber(){
		return finWorkerTabNumber;
	}

	public void setFinWorkerTabNumber(String finWorkerTabNumber) {
		this.finWorkerTabNumber = finWorkerTabNumber;
	}

	public String getFinWorkerPositionName(){
		return finWorkerPositionName;
	}

	public void setFinWorkerPositionName(String finWorkerPositionName) {
		this.finWorkerPositionName = finWorkerPositionName;
	}

	public int getFinWorkerPositionCode(){
		return finWorkerPositionCode;
	}

	public void setFinWorkerPositionCode(int finWorkerPositionCode) {
		this.finWorkerPositionCode = finWorkerPositionCode;
	}

	public String getFinWorkerDepartmentName(){
		return finWorkerDepartmentName;
	}

	public void setFinWorkerDepartmentName(String finWorkerDepartmentName) {
		this.finWorkerDepartmentName = finWorkerDepartmentName;
	}

	public String getFinWorkerDepartmentCode(){
		return finWorkerDepartmentCode;
	}

	public void setFinWorkerDepartmentCode(String finWorkerDepartmentCode) {
		this.finWorkerDepartmentCode = finWorkerDepartmentCode;
	}

	public BigDecimal getFinWorkerPriceGen(){
		return finWorkerPriceGen;
	}

	public void setFinWorkerPriceGen(BigDecimal finWorkerPriceGen) {
		this.finWorkerPriceGen = finWorkerPriceGen;
	}

	public int getFinWorkerCategor(){
		return finWorkerCategor;
	}

	public void setFinWorkerCategor(int finWorkerCategor) {
		this.finWorkerCategor = finWorkerCategor;
	}

	public int getFinWorkerFinCode(){
		return finWorkerFinCode;
	}

	public void setFinWorkerFinCode(int finWorkerFinCode) {
		this.finWorkerFinCode = finWorkerFinCode;
	}

	public int getFinWorkerIsSentAssignment(){
		return finWorkerIsSentAssignment;
	}

	public void setFinWorkerIsSentAssignment(int finWorkerIsSentAssignment) {
		this.finWorkerIsSentAssignment = finWorkerIsSentAssignment;
	}

	public BigDecimal getFinWorkerChargePercent(){
		return finWorkerChargePercent;
	}

	public void setFinWorkerChargePercent(BigDecimal finWorkerChargePercent) {
		this.finWorkerChargePercent = finWorkerChargePercent;
	}

	public int getFinWorkerCategorId(){
		return finWorkerCategorId;
	}

	public void setFinWorkerCategorId(int finWorkerCategorId) {
		this.finWorkerCategorId = finWorkerCategorId;
	}

	public String getFinWorkerCategorName(){
		return finWorkerCategorName;
	}

	public void setFinWorkerCategorName(String finWorkerCategorName) {
		this.finWorkerCategorName = finWorkerCategorName;
	}

	public String getFinWorkerWorkTimeId(){
		return finWorkerWorkTimeId;
	}

	public void setFinWorkerWorkTimeId(String finWorkerWorkTimeId) {
		this.finWorkerWorkTimeId = finWorkerWorkTimeId;
	}

	public String getFinWorkerPositionId(){
		return finWorkerPositionId;
	}

	public void setFinWorkerPositionId(String finWorkerPositionId) {
		this.finWorkerPositionId = finWorkerPositionId;
	}



}

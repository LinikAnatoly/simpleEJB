
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  import java.io.Serializable;

/**
  * Short Object for ENWarrant4Department;
  */

import java.math.BigDecimal;
import java.util.Date;


public class ENWarrant4DepartmentShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String userGen;
	public int agreementKindRefCode = Integer.MIN_VALUE;
	public String agreementKindRefName;
	public String agreementKindRefUserGen;
	public int warrantRefCode = Integer.MIN_VALUE;
	public String warrantRefNumbergen;
	public String warrantRefName;
	public String warrantRefWarrantFIO;
	public String warrantRefWarrantShortFIO;
	public String warrantRefWarrantPosition;
	public String warrantRefGenitiveFIO;
	public String warrantRefGenitivePosition;
	public String warrantRefPassport;
	public String warrantRefAddress;
	public int warrantRefPower = Integer.MIN_VALUE;
	public BigDecimal warrantRefMaxSum;
	public String warrantRefDepartmentName;
	public String warrantRefDepartmentNameGenitive;
	public int departmentRefCode = Integer.MIN_VALUE;
	public String departmentRefShortName;
	public Date departmentRefDateStart;
	public Date departmentRefDateFinal;
	public int departmentRefRenCode = Integer.MIN_VALUE;
	public String departmentRefShpzBalans;
	public int departmentRefKau_table_id_1884 = Integer.MIN_VALUE;
	public String departmentRefKau_1884;
	public String departmentRefName_1884;
	public String departmentRefHrmorganizationid;

	/**  **************************  */
	public Date dateEdit;
	/**  **************************  */




	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getUserGen() {
		return userGen;
	}

	public void setUserGen(String userGen) {
		this.userGen = userGen;
	}



	public int getAgreementKindRefCode(){
		return agreementKindRefCode;
	}

	public void setAgreementKindRefCode(int agreementKindRefCode) {
		this.agreementKindRefCode = agreementKindRefCode;
	}

	public String getAgreementKindRefName(){
		return agreementKindRefName;
	}

	public void setAgreementKindRefName(String agreementKindRefName) {
		this.agreementKindRefName = agreementKindRefName;
	}

	public String getAgreementKindRefUserGen(){
		return agreementKindRefUserGen;
	}

	public void setAgreementKindRefUserGen(String agreementKindRefUserGen) {
		this.agreementKindRefUserGen = agreementKindRefUserGen;
	}

	public int getWarrantRefCode(){
		return warrantRefCode;
	}

	public void setWarrantRefCode(int warrantRefCode) {
		this.warrantRefCode = warrantRefCode;
	}

	public String getWarrantRefNumbergen(){
		return warrantRefNumbergen;
	}

	public void setWarrantRefNumbergen(String warrantRefNumbergen) {
		this.warrantRefNumbergen = warrantRefNumbergen;
	}

	public String getWarrantRefName(){
		return warrantRefName;
	}

	public void setWarrantRefName(String warrantRefName) {
		this.warrantRefName = warrantRefName;
	}

	public String getWarrantRefWarrantFIO(){
		return warrantRefWarrantFIO;
	}

	public void setWarrantRefWarrantFIO(String warrantRefWarrantFIO) {
		this.warrantRefWarrantFIO = warrantRefWarrantFIO;
	}

	public String getWarrantRefWarrantShortFIO(){
		return warrantRefWarrantShortFIO;
	}

	public void setWarrantRefWarrantShortFIO(String warrantRefWarrantShortFIO) {
		this.warrantRefWarrantShortFIO = warrantRefWarrantShortFIO;
	}

	public String getWarrantRefWarrantPosition(){
		return warrantRefWarrantPosition;
	}

	public void setWarrantRefWarrantPosition(String warrantRefWarrantPosition) {
		this.warrantRefWarrantPosition = warrantRefWarrantPosition;
	}

	public String getWarrantRefGenitiveFIO(){
		return warrantRefGenitiveFIO;
	}

	public void setWarrantRefGenitiveFIO(String warrantRefGenitiveFIO) {
		this.warrantRefGenitiveFIO = warrantRefGenitiveFIO;
	}

	public String getWarrantRefGenitivePosition(){
		return warrantRefGenitivePosition;
	}

	public void setWarrantRefGenitivePosition(String warrantRefGenitivePosition) {
		this.warrantRefGenitivePosition = warrantRefGenitivePosition;
	}

	public String getWarrantRefPassport(){
		return warrantRefPassport;
	}

	public void setWarrantRefPassport(String warrantRefPassport) {
		this.warrantRefPassport = warrantRefPassport;
	}

	public String getWarrantRefAddress(){
		return warrantRefAddress;
	}

	public void setWarrantRefAddress(String warrantRefAddress) {
		this.warrantRefAddress = warrantRefAddress;
	}

	public int getWarrantRefPower(){
		return warrantRefPower;
	}

	public void setWarrantRefPower(int warrantRefPower) {
		this.warrantRefPower = warrantRefPower;
	}

	public BigDecimal getWarrantRefMaxSum(){
		return warrantRefMaxSum;
	}

	public void setWarrantRefMaxSum(BigDecimal warrantRefMaxSum) {
		this.warrantRefMaxSum = warrantRefMaxSum;
	}

	public String getWarrantRefDepartmentName(){
		return warrantRefDepartmentName;
	}

	public void setWarrantRefDepartmentName(String warrantRefDepartmentName) {
		this.warrantRefDepartmentName = warrantRefDepartmentName;
	}

	public String getWarrantRefDepartmentNameGenitive(){
		return warrantRefDepartmentNameGenitive;
	}

	public void setWarrantRefDepartmentNameGenitive(String warrantRefDepartmentNameGenitive) {
		this.warrantRefDepartmentNameGenitive = warrantRefDepartmentNameGenitive;
	}

	public int getDepartmentRefCode(){
		return departmentRefCode;
	}

	public void setDepartmentRefCode(int departmentRefCode) {
		this.departmentRefCode = departmentRefCode;
	}

	public String getDepartmentRefShortName(){
		return departmentRefShortName;
	}

	public void setDepartmentRefShortName(String departmentRefShortName) {
		this.departmentRefShortName = departmentRefShortName;
	}

	public Date getDepartmentRefDateStart(){
		return departmentRefDateStart;
	}

	public void setDepartmentRefDateStart(Date departmentRefDateStart) {
		this.departmentRefDateStart = departmentRefDateStart;
	}

	public Date getDepartmentRefDateFinal(){
		return departmentRefDateFinal;
	}

	public void setDepartmentRefDateFinal(Date departmentRefDateFinal) {
		this.departmentRefDateFinal = departmentRefDateFinal;
	}

	public int getDepartmentRefRenCode(){
		return departmentRefRenCode;
	}

	public void setDepartmentRefRenCode(int departmentRefRenCode) {
		this.departmentRefRenCode = departmentRefRenCode;
	}

	public String getDepartmentRefShpzBalans(){
		return departmentRefShpzBalans;
	}

	public void setDepartmentRefShpzBalans(String departmentRefShpzBalans) {
		this.departmentRefShpzBalans = departmentRefShpzBalans;
	}

	public int getDepartmentRefKau_table_id_1884(){
		return departmentRefKau_table_id_1884;
	}

	public void setDepartmentRefKau_table_id_1884(int departmentRefKau_table_id_1884) {
		this.departmentRefKau_table_id_1884 = departmentRefKau_table_id_1884;
	}

	public String getDepartmentRefKau_1884(){
		return departmentRefKau_1884;
	}

	public void setDepartmentRefKau_1884(String departmentRefKau_1884) {
		this.departmentRefKau_1884 = departmentRefKau_1884;
	}

	public String getDepartmentRefName_1884(){
		return departmentRefName_1884;
	}

	public void setDepartmentRefName_1884(String departmentRefName_1884) {
		this.departmentRefName_1884 = departmentRefName_1884;
	}

	public String getDepartmentRefHrmorganizationid(){
		return departmentRefHrmorganizationid;
	}

	public void setDepartmentRefHrmorganizationid(String departmentRefHrmorganizationid) {
		this.departmentRefHrmorganizationid = departmentRefHrmorganizationid;
	}

	public Date getDateEdit() {
		return dateEdit;
	}

	public void setDateEdit(Date dateEdit) {
		this.dateEdit = dateEdit;
	}

}

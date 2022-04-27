
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENServicesFromSideObject;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENServicesFromSideObjectShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String numberProject;
	public String contractNumber;
	public Date contractDate ;
	public String name;
	public String partnerCode;
	public String finDocCode;
	public int finDocID = Integer.MIN_VALUE;
	public String commentGen;
	public String userGen;
	public Date dateEdit ;
	public int departmentCode = Integer.MIN_VALUE;
	public String departmentShortName;
	public Date departmentDateStart;
	public Date departmentDateFinal;
	public int departmentRenCode = Integer.MIN_VALUE;
	public String departmentShpzBalans;
	public int departmentKau_table_id_1884 = Integer.MIN_VALUE;
	public String departmentKau_1884;
	public String departmentName_1884;
	public String departmentHrmorganizationid;
	public int elementCode = Integer.MIN_VALUE;
	public int generalContractRefCode = Integer.MIN_VALUE;
	public int generalContractRefFinDocID = Integer.MIN_VALUE;
	public String generalContractRefFinDocCode;
	public String generalContractRefContractNumber;
	public Date generalContractRefContractDate;
	public String generalContractRefCommentGen;
	public int generalContractRefPartnerId = Integer.MIN_VALUE;
	public String generalContractRefPartnerCode;
	public String generalContractRefPartnerName;
	public Date generalContractRefContractRegDate;
	public Date generalContractRefContractStartDate;
	public Date generalContractRefContractEndDate;
	public String generalContractRefAxContractId;
	public String generalContractRefAxContractCode;
	public String generalContractRefAxContractNumber;
	public String generalContractRefAxContractAccount;
	public Date generalContractRefAxContractDate;
	public String generalContractRefAxContractCommentGen;
	public String generalContractRefAxContractGroupCode;
	public String generalContractRefAxPartnerCode;
	public String generalContractRefAxPartnerName;
	public String generalContractRefUserGen;
	public int statusRefCode = Integer.MIN_VALUE;
	public String statusRefName;

	public BigDecimal bill_sum;
	public BigDecimal pay_sum;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getNumberProject() {
		return numberProject;
	}

	public void setNumberProject(String numberProject) {
		this.numberProject = numberProject;
	}

	public String getContractNumber() {
		return contractNumber;
	}

	public void setContractNumber(String contractNumber) {
		this.contractNumber = contractNumber;
	}

	public Date getContractDate() {
		return contractDate;
	}

	public void setContractDate(Date contractDate) {
		this.contractDate = contractDate;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPartnerCode() {
		return partnerCode;
	}

	public void setPartnerCode(String partnerCode) {
		this.partnerCode = partnerCode;
	}

	public String getFinDocCode() {
		return finDocCode;
	}

	public void setFinDocCode(String finDocCode) {
		this.finDocCode = finDocCode;
	}

	public int getFinDocID() {
		return finDocID;
	}

	public void setFinDocID(int finDocID) {
		this.finDocID = finDocID;
	}

	public String getCommentGen() {
		return commentGen;
	}

	public void setCommentGen(String commentGen) {
		this.commentGen = commentGen;
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




	public int getDepartmentCode(){
		return departmentCode;
	}

	public void setDepartmentCode(int departmentCode) {
		this.departmentCode = departmentCode;
	}

	public String getDepartmentShortName(){
		return departmentShortName;
	}

	public void setDepartmentShortName(String departmentShortName) {
		this.departmentShortName = departmentShortName;
	}

	public Date getDepartmentDateStart(){
		return departmentDateStart;
	}

	public void setDepartmentDateStart(Date departmentDateStart) {
		this.departmentDateStart = departmentDateStart;
	}

	public Date getDepartmentDateFinal(){
		return departmentDateFinal;
	}

	public void setDepartmentDateFinal(Date departmentDateFinal) {
		this.departmentDateFinal = departmentDateFinal;
	}

	public int getDepartmentRenCode(){
		return departmentRenCode;
	}

	public void setDepartmentRenCode(int departmentRenCode) {
		this.departmentRenCode = departmentRenCode;
	}

	public String getDepartmentShpzBalans(){
		return departmentShpzBalans;
	}

	public void setDepartmentShpzBalans(String departmentShpzBalans) {
		this.departmentShpzBalans = departmentShpzBalans;
	}

	public int getDepartmentKau_table_id_1884(){
		return departmentKau_table_id_1884;
	}

	public void setDepartmentKau_table_id_1884(int departmentKau_table_id_1884) {
		this.departmentKau_table_id_1884 = departmentKau_table_id_1884;
	}

	public String getDepartmentKau_1884(){
		return departmentKau_1884;
	}

	public void setDepartmentKau_1884(String departmentKau_1884) {
		this.departmentKau_1884 = departmentKau_1884;
	}

	public String getDepartmentName_1884(){
		return departmentName_1884;
	}

	public void setDepartmentName_1884(String departmentName_1884) {
		this.departmentName_1884 = departmentName_1884;
	}

	public String getDepartmentHrmorganizationid(){
		return departmentHrmorganizationid;
	}

	public void setDepartmentHrmorganizationid(String departmentHrmorganizationid) {
		this.departmentHrmorganizationid = departmentHrmorganizationid;
	}

	public int getElementCode(){
		return elementCode;
	}

	public void setElementCode(int elementCode) {
		this.elementCode = elementCode;
	}

	public int getGeneralContractRefCode(){
		return generalContractRefCode;
	}

	public void setGeneralContractRefCode(int generalContractRefCode) {
		this.generalContractRefCode = generalContractRefCode;
	}

	public int getGeneralContractRefFinDocID(){
		return generalContractRefFinDocID;
	}

	public void setGeneralContractRefFinDocID(int generalContractRefFinDocID) {
		this.generalContractRefFinDocID = generalContractRefFinDocID;
	}

	public String getGeneralContractRefFinDocCode(){
		return generalContractRefFinDocCode;
	}

	public void setGeneralContractRefFinDocCode(String generalContractRefFinDocCode) {
		this.generalContractRefFinDocCode = generalContractRefFinDocCode;
	}

	public String getGeneralContractRefContractNumber(){
		return generalContractRefContractNumber;
	}

	public void setGeneralContractRefContractNumber(String generalContractRefContractNumber) {
		this.generalContractRefContractNumber = generalContractRefContractNumber;
	}

	public Date getGeneralContractRefContractDate(){
		return generalContractRefContractDate;
	}

	public void setGeneralContractRefContractDate(Date generalContractRefContractDate) {
		this.generalContractRefContractDate = generalContractRefContractDate;
	}

	public String getGeneralContractRefCommentGen(){
		return generalContractRefCommentGen;
	}

	public void setGeneralContractRefCommentGen(String generalContractRefCommentGen) {
		this.generalContractRefCommentGen = generalContractRefCommentGen;
	}

	public int getGeneralContractRefPartnerId(){
		return generalContractRefPartnerId;
	}

	public void setGeneralContractRefPartnerId(int generalContractRefPartnerId) {
		this.generalContractRefPartnerId = generalContractRefPartnerId;
	}

	public String getGeneralContractRefPartnerCode(){
		return generalContractRefPartnerCode;
	}

	public void setGeneralContractRefPartnerCode(String generalContractRefPartnerCode) {
		this.generalContractRefPartnerCode = generalContractRefPartnerCode;
	}

	public String getGeneralContractRefPartnerName(){
		return generalContractRefPartnerName;
	}

	public void setGeneralContractRefPartnerName(String generalContractRefPartnerName) {
		this.generalContractRefPartnerName = generalContractRefPartnerName;
	}

	public Date getGeneralContractRefContractRegDate(){
		return generalContractRefContractRegDate;
	}

	public void setGeneralContractRefContractRegDate(Date generalContractRefContractRegDate) {
		this.generalContractRefContractRegDate = generalContractRefContractRegDate;
	}

	public Date getGeneralContractRefContractStartDate(){
		return generalContractRefContractStartDate;
	}

	public void setGeneralContractRefContractStartDate(Date generalContractRefContractStartDate) {
		this.generalContractRefContractStartDate = generalContractRefContractStartDate;
	}

	public Date getGeneralContractRefContractEndDate(){
		return generalContractRefContractEndDate;
	}

	public void setGeneralContractRefContractEndDate(Date generalContractRefContractEndDate) {
		this.generalContractRefContractEndDate = generalContractRefContractEndDate;
	}

	public String getGeneralContractRefAxContractId(){
		return generalContractRefAxContractId;
	}

	public void setGeneralContractRefAxContractId(String generalContractRefAxContractId) {
		this.generalContractRefAxContractId = generalContractRefAxContractId;
	}

	public String getGeneralContractRefAxContractCode(){
		return generalContractRefAxContractCode;
	}

	public void setGeneralContractRefAxContractCode(String generalContractRefAxContractCode) {
		this.generalContractRefAxContractCode = generalContractRefAxContractCode;
	}

	public String getGeneralContractRefAxContractNumber(){
		return generalContractRefAxContractNumber;
	}

	public void setGeneralContractRefAxContractNumber(String generalContractRefAxContractNumber) {
		this.generalContractRefAxContractNumber = generalContractRefAxContractNumber;
	}

	public String getGeneralContractRefAxContractAccount(){
		return generalContractRefAxContractAccount;
	}

	public void setGeneralContractRefAxContractAccount(String generalContractRefAxContractAccount) {
		this.generalContractRefAxContractAccount = generalContractRefAxContractAccount;
	}

	public Date getGeneralContractRefAxContractDate(){
		return generalContractRefAxContractDate;
	}

	public void setGeneralContractRefAxContractDate(Date generalContractRefAxContractDate) {
		this.generalContractRefAxContractDate = generalContractRefAxContractDate;
	}

	public String getGeneralContractRefAxContractCommentGen(){
		return generalContractRefAxContractCommentGen;
	}

	public void setGeneralContractRefAxContractCommentGen(String generalContractRefAxContractCommentGen) {
		this.generalContractRefAxContractCommentGen = generalContractRefAxContractCommentGen;
	}

	public String getGeneralContractRefAxContractGroupCode(){
		return generalContractRefAxContractGroupCode;
	}

	public void setGeneralContractRefAxContractGroupCode(String generalContractRefAxContractGroupCode) {
		this.generalContractRefAxContractGroupCode = generalContractRefAxContractGroupCode;
	}

	public String getGeneralContractRefAxPartnerCode(){
		return generalContractRefAxPartnerCode;
	}

	public void setGeneralContractRefAxPartnerCode(String generalContractRefAxPartnerCode) {
		this.generalContractRefAxPartnerCode = generalContractRefAxPartnerCode;
	}

	public String getGeneralContractRefAxPartnerName(){
		return generalContractRefAxPartnerName;
	}

	public void setGeneralContractRefAxPartnerName(String generalContractRefAxPartnerName) {
		this.generalContractRefAxPartnerName = generalContractRefAxPartnerName;
	}

	public String getGeneralContractRefUserGen(){
		return generalContractRefUserGen;
	}

	public void setGeneralContractRefUserGen(String generalContractRefUserGen) {
		this.generalContractRefUserGen = generalContractRefUserGen;
	}

	public int getStatusRefCode(){
		return statusRefCode;
	}

	public void setStatusRefCode(int statusRefCode) {
		this.statusRefCode = statusRefCode;
	}

	public String getStatusRefName(){
		return statusRefName;
	}

	public void setStatusRefName(String statusRefName) {
		this.statusRefName = statusRefName;
	}

	public BigDecimal getBill_sum() {
		return bill_sum;
	}

	public void setBill_sum(BigDecimal bill_sum) {
		this.bill_sum = bill_sum;
	}

	public BigDecimal getPay_sum() {
		return pay_sum;
	}

	public void setPay_sum(BigDecimal pay_sum) {
		this.pay_sum = pay_sum;
	}


}

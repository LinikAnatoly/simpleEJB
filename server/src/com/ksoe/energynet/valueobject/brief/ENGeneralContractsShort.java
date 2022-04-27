
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENGeneralContracts;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENGeneralContractsShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public int finDocID = Integer.MIN_VALUE;
	public String finDocCode;
	public String contractNumber;
	public Date contractDate ;
	public String commentGen;
	public int partnerId = Integer.MIN_VALUE;
	public String partnerCode;
	public String partnerName;
	public Date contractRegDate ;
	public Date contractStartDate ;
	public Date contractEndDate ;
	public String axContractId;
	public String axContractCode;
	public String axContractNumber;
	public String axContractAccount;
	public Date axContractDate ;
	public String axContractCommentGen;
	public String axContractGroupCode;
	public String axPartnerCode;
	public String axPartnerName;
	public String userGen;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setFinDocID(int aValue){
		finDocID = aValue;
	}

	public int getFinDocID(){
		return finDocID;
	}

	public void setFinDocCode(String aValue){
		finDocCode = aValue;
	}

	public String getFinDocCode(){
		return finDocCode;
	}

	public void setContractNumber(String aValue){
		contractNumber = aValue;
	}

	public String getContractNumber(){
		return contractNumber;
	}

	public void setContractDate(Date aValue){
		contractDate = aValue;
	}

	public Date getContractDate(){
		return contractDate;
	}

	public void setCommentGen(String aValue){
		commentGen = aValue;
	}

	public String getCommentGen(){
		return commentGen;
	}

	public void setPartnerId(int aValue){
		partnerId = aValue;
	}

	public int getPartnerId(){
		return partnerId;
	}

	public void setPartnerCode(String aValue){
		partnerCode = aValue;
	}

	public String getPartnerCode(){
		return partnerCode;
	}

	public void setPartnerName(String aValue){
		partnerName = aValue;
	}

	public String getPartnerName(){
		return partnerName;
	}

	public void setContractRegDate(Date aValue){
		contractRegDate = aValue;
	}

	public Date getContractRegDate(){
		return contractRegDate;
	}

	public void setContractStartDate(Date aValue){
		contractStartDate = aValue;
	}

	public Date getContractStartDate(){
		return contractStartDate;
	}

	public void setContractEndDate(Date aValue){
		contractEndDate = aValue;
	}

	public Date getContractEndDate(){
		return contractEndDate;
	}

	public void setAxContractId(String aValue){
		axContractId = aValue;
	}

	public String getAxContractId(){
		return axContractId;
	}

	public void setAxContractCode(String aValue){
		axContractCode = aValue;
	}

	public String getAxContractCode(){
		return axContractCode;
	}

	public void setAxContractNumber(String aValue){
		axContractNumber = aValue;
	}

	public String getAxContractNumber(){
		return axContractNumber;
	}

	public void setAxContractAccount(String aValue){
		axContractAccount = aValue;
	}

	public String getAxContractAccount(){
		return axContractAccount;
	}

	public void setAxContractDate(Date aValue){
		axContractDate = aValue;
	}

	public Date getAxContractDate(){
		return axContractDate;
	}

	public void setAxContractCommentGen(String aValue){
		axContractCommentGen = aValue;
	}

	public String getAxContractCommentGen(){
		return axContractCommentGen;
	}

	public void setAxContractGroupCode(String aValue){
		axContractGroupCode = aValue;
	}

	public String getAxContractGroupCode(){
		return axContractGroupCode;
	}

	public void setAxPartnerCode(String aValue){
		axPartnerCode = aValue;
	}

	public String getAxPartnerCode(){
		return axPartnerCode;
	}

	public void setAxPartnerName(String aValue){
		axPartnerName = aValue;
	}

	public String getAxPartnerName(){
		return axPartnerName;
	}

	public void setUserGen(String aValue){
		userGen = aValue;
	}

	public String getUserGen(){
		return userGen;
	}






}
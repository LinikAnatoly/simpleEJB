
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENAct2Prov;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENAct2ProvShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public int partId = Integer.MIN_VALUE;
	public String userGen;
	public Date datePosting ;
	public Date dateEdit ;
	public String voucher;
	public int isIncomeAct = Integer.MIN_VALUE;
	public int actRefCode = Integer.MIN_VALUE;
	public String actRefNumberGen;
	public Date actRefDateGen;
	public int actRefFinDocCode = Integer.MIN_VALUE;
	public int actRefFinDocMechanicCode = Integer.MIN_VALUE;
	public String actRefFinMolName;
	public String actRefFinMechanicName;
	public String actRefInvNumber;
	public String actRefUserGen;
	public Date actRefDateEdit;
	public Date actRefDateAct;
	public String actRefMolCodeObject;
	public int actPostingKindRefCode = Integer.MIN_VALUE;
	public String actPostingKindRefName;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setPartId(int aValue){
		partId = aValue;
	}

	public int getPartId(){
		return partId;
	}

	public void setUserGen(String aValue){
		userGen = aValue;
	}

	public String getUserGen(){
		return userGen;
	}

	public void setDatePosting(Date aValue){
		datePosting = aValue;
	}

	public Date getDatePosting(){
		return datePosting;
	}

	public void setDateEdit(Date aValue){
		dateEdit = aValue;
	}

	public Date getDateEdit(){
		return dateEdit;
	}


	public void setVoucher(String aValue){
		voucher = aValue;
	}

	public String getVoucher(){
		return voucher;
	}

	public void setIsIncomeAct(int aValue){
		isIncomeAct = aValue;
	}

	public int getIsIncomeAct(){
		return isIncomeAct;
	}


	public void setActRefCode(int aValue){
		actRefCode = aValue;
	}
	public int getActRefCode(){
		return actRefCode;
	}

	public void setActRefNumberGen(String aValue){
		actRefNumberGen = aValue;
	}
	public String getActRefNumberGen(){
		return actRefNumberGen;
	}

	public void setActRefDateGen(Date aValue){
		actRefDateGen = aValue;
	}
	public Date getActRefDateGen(){
		return actRefDateGen;
	}

	public void setActRefFinDocCode(int aValue){
		actRefFinDocCode = aValue;
	}
	public int getActRefFinDocCode(){
		return actRefFinDocCode;
	}

	public void setActRefFinDocMechanicCode(int aValue){
		actRefFinDocMechanicCode = aValue;
	}
	public int getActRefFinDocMechanicCode(){
		return actRefFinDocMechanicCode;
	}

	public void setActRefFinMolName(String aValue){
		actRefFinMolName = aValue;
	}
	public String getActRefFinMolName(){
		return actRefFinMolName;
	}

	public void setActRefFinMechanicName(String aValue){
		actRefFinMechanicName = aValue;
	}
	public String getActRefFinMechanicName(){
		return actRefFinMechanicName;
	}

	public void setActRefInvNumber(String aValue){
		actRefInvNumber = aValue;
	}
	public String getActRefInvNumber(){
		return actRefInvNumber;
	}

	public void setActRefUserGen(String aValue){
		actRefUserGen = aValue;
	}
	public String getActRefUserGen(){
		return actRefUserGen;
	}

	public void setActRefDateEdit(Date aValue){
		actRefDateEdit = aValue;
	}
	public Date getActRefDateEdit(){
		return actRefDateEdit;
	}

	public void setActRefDateAct(Date aValue){
		actRefDateAct = aValue;
	}
	public Date getActRefDateAct(){
		return actRefDateAct;
	}

	public void setActRefMolCodeObject(String aValue){
		actRefMolCodeObject = aValue;
	}
	public String getActRefMolCodeObject(){
		return actRefMolCodeObject;
	}

	public void setActPostingKindRefCode(int aValue){
		actPostingKindRefCode = aValue;
	}
	public int getActPostingKindRefCode(){
		return actPostingKindRefCode;
	}

	public void setActPostingKindRefName(String aValue){
		actPostingKindRefName = aValue;
	}
	public String getActPostingKindRefName(){
		return actPostingKindRefName;
	}



}
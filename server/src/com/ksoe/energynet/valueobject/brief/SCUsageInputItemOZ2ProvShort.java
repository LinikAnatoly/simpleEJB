
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for SCUsageInputItemOZ2Prov;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class SCUsageInputItemOZ2ProvShort implements Serializable {

	public int code = Integer.MIN_VALUE;
	public int partId = Integer.MIN_VALUE;
	public String userGen;
	public Date datePosting ;
	public Date dateEdit ;
	public String voucher;
	public int ozRefCode = Integer.MIN_VALUE;
	public String ozRefNumberDoc;
	public String ozRefCounterType;
	public String ozRefAccount;
	public BigDecimal ozRefCost;
	public int ozRefCountGen = Integer.MIN_VALUE;
	public int ozRefScCode = Integer.MIN_VALUE;


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


	public void setOzRefCode(int aValue){
		ozRefCode = aValue;
	}
	public int getOzRefCode(){
		return ozRefCode;
	}

	public void setOzRefNumberDoc(String aValue){
		ozRefNumberDoc = aValue;
	}
	public String getOzRefNumberDoc(){
		return ozRefNumberDoc;
	}

	public void setOzRefCounterType(String aValue){
		ozRefCounterType = aValue;
	}
	public String getOzRefCounterType(){
		return ozRefCounterType;
	}

	public void setOzRefAccount(String aValue){
		ozRefAccount = aValue;
	}
	public String getOzRefAccount(){
		return ozRefAccount;
	}

	public void setOzRefCost(BigDecimal aValue){
		ozRefCost = aValue;
	}
	public BigDecimal getOzRefCost(){
		return ozRefCost;
	}

	public void setOzRefCountGen(int aValue){
		ozRefCountGen = aValue;
	}
	public int getOzRefCountGen(){
		return ozRefCountGen;
	}

	public void setOzRefScCode(int aValue){
		ozRefScCode = aValue;
	}
	public int getOzRefScCode(){
		return ozRefScCode;
	}



}

//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENGPSTracker;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENGPSTrackerShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String reg_id;
	public String phoneNumber;
	public String cardNumber;
	public String userGen;
	public Date dateEdit ;
	public int realTransportCode = Integer.MIN_VALUE;
	public String realTransportName;
	public String realTransportInvNumber;
	public String realTransportGosNumber;


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

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
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


	public int getRealTransportCode(){
		return realTransportCode;
	}

	public void setRealTransportCode(int realTransportCode) {
		this.realTransportCode = realTransportCode;
	}

	public String getRealTransportName(){
		return realTransportName;
	}

	public void setRealTransportName(String realTransportName) {
		this.realTransportName = realTransportName;
	}

	public String getRealTransportInvNumber(){
		return realTransportInvNumber;
	}

	public void setRealTransportInvNumber(String realTransportInvNumber) {
		this.realTransportInvNumber = realTransportInvNumber;
	}

	public String getRealTransportGosNumber(){
		return realTransportGosNumber;
	}

	public void setRealTransportGosNumber(String realTransportGosNumber) {
		this.realTransportGosNumber = realTransportGosNumber;
	}



}


//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENGPSTrackerHistory;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENGPSTrackerHistoryShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public Date dateStart ;
	public Date dateFinal ;
	public String reg_id;
	public String phoneNumber;
	public String cardNumber;
	public String userGen;
	public Date dateEdit ;
	public int realTransportCode = Integer.MIN_VALUE;
	public String realTransportName;
	public String realTransportInvNumber;
	public String realTransportGosNumber;
	public int gpsTrackerCode = Integer.MIN_VALUE;
	public String gpsTrackerReg_id;
	public String gpsTrackerPhoneNumber;
	public String gpsTrackerCardNumber;
	public String gpsTrackerUserGen;
	public Date gpsTrackerDateEdit;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public Date getDateStart() {
		return dateStart;
	}

	public void setDateStart(Date dateStart) {
		this.dateStart = dateStart;
	}

	public Date getDateFinal() {
		return dateFinal;
	}

	public void setDateFinal(Date dateFinal) {
		this.dateFinal = dateFinal;
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

	public int getGpsTrackerCode(){
		return gpsTrackerCode;
	}

	public void setGpsTrackerCode(int gpsTrackerCode) {
		this.gpsTrackerCode = gpsTrackerCode;
	}

	public String getGpsTrackerReg_id(){
		return gpsTrackerReg_id;
	}

	public void setGpsTrackerReg_id(String gpsTrackerReg_id) {
		this.gpsTrackerReg_id = gpsTrackerReg_id;
	}

	public String getGpsTrackerPhoneNumber(){
		return gpsTrackerPhoneNumber;
	}

	public void setGpsTrackerPhoneNumber(String gpsTrackerPhoneNumber) {
		this.gpsTrackerPhoneNumber = gpsTrackerPhoneNumber;
	}

	public String getGpsTrackerCardNumber(){
		return gpsTrackerCardNumber;
	}

	public void setGpsTrackerCardNumber(String gpsTrackerCardNumber) {
		this.gpsTrackerCardNumber = gpsTrackerCardNumber;
	}

	public String getGpsTrackerUserGen(){
		return gpsTrackerUserGen;
	}

	public void setGpsTrackerUserGen(String gpsTrackerUserGen) {
		this.gpsTrackerUserGen = gpsTrackerUserGen;
	}

	public Date getGpsTrackerDateEdit(){
		return gpsTrackerDateEdit;
	}

	public void setGpsTrackerDateEdit(Date gpsTrackerDateEdit) {
		this.gpsTrackerDateEdit = gpsTrackerDateEdit;
	}



}

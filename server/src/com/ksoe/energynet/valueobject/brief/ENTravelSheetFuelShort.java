
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2022 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTravelSheetFuel;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENTravelSheetFuelShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public BigDecimal countGen;
	public String series;
	public String numbers;
	public Date dateGen ;
	public int isVRTU = Integer.MIN_VALUE;
	public Boolean isThirdParty ;
	public int travelSheetRefCode = Integer.MIN_VALUE;
	public String travelSheetRefNumberGen;
	public Date travelSheetRefDateStart;
	public Date travelSheetRefDateFinal;
	public BigDecimal travelSheetRefSpeedometerStart;
	public BigDecimal travelSheetRefSpeedometerFinal;
	public BigDecimal travelSheetRefFuelCounterStart;
	public BigDecimal travelSheetRefFuelCounterFinal;
	public Date travelSheetRefTimeStart;
	public Date travelSheetRefTimeFinal;
	public Date travelSheetRefDateEdit;
	public String travelSheetRefUserGen;
	public int realTransportCode = Integer.MIN_VALUE;
	public String realTransportName;
	public String realTransportInvNumber;
	public String realTransportGosNumber;
	public int fuelTypeCode = Integer.MIN_VALUE;
	public String fuelTypeName;
	public int travelSheetFuelTypeRefCode = Integer.MIN_VALUE;
	public String travelSheetFuelTypeRefName;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public BigDecimal getCountGen() {
		return countGen;
	}

	public void setCountGen(BigDecimal countGen) {
		this.countGen = countGen;
	}

	public String getSeries() {
		return series;
	}

	public void setSeries(String series) {
		this.series = series;
	}

	public String getNumbers() {
		return numbers;
	}

	public void setNumbers(String numbers) {
		this.numbers = numbers;
	}

	public Date getDateGen() {
		return dateGen;
	}

	public void setDateGen(Date dateGen) {
		this.dateGen = dateGen;
	}

	public int getIsVRTU() {
		return isVRTU;
	}

	public void setIsVRTU(int isVRTU) {
		this.isVRTU = isVRTU;
	}

	public Boolean getIsThirdParty() {
		return isThirdParty;
	}

	public void setIsThirdParty(Boolean isThirdParty) {
		this.isThirdParty = isThirdParty;
	}



	public int getTravelSheetRefCode(){
		return travelSheetRefCode;
	}

	public void setTravelSheetRefCode(int travelSheetRefCode) {
		this.travelSheetRefCode = travelSheetRefCode;
	}

	public String getTravelSheetRefNumberGen(){
		return travelSheetRefNumberGen;
	}

	public void setTravelSheetRefNumberGen(String travelSheetRefNumberGen) {
		this.travelSheetRefNumberGen = travelSheetRefNumberGen;
	}

	public Date getTravelSheetRefDateStart(){
		return travelSheetRefDateStart;
	}

	public void setTravelSheetRefDateStart(Date travelSheetRefDateStart) {
		this.travelSheetRefDateStart = travelSheetRefDateStart;
	}

	public Date getTravelSheetRefDateFinal(){
		return travelSheetRefDateFinal;
	}

	public void setTravelSheetRefDateFinal(Date travelSheetRefDateFinal) {
		this.travelSheetRefDateFinal = travelSheetRefDateFinal;
	}

	public BigDecimal getTravelSheetRefSpeedometerStart(){
		return travelSheetRefSpeedometerStart;
	}

	public void setTravelSheetRefSpeedometerStart(BigDecimal travelSheetRefSpeedometerStart) {
		this.travelSheetRefSpeedometerStart = travelSheetRefSpeedometerStart;
	}

	public BigDecimal getTravelSheetRefSpeedometerFinal(){
		return travelSheetRefSpeedometerFinal;
	}

	public void setTravelSheetRefSpeedometerFinal(BigDecimal travelSheetRefSpeedometerFinal) {
		this.travelSheetRefSpeedometerFinal = travelSheetRefSpeedometerFinal;
	}

	public BigDecimal getTravelSheetRefFuelCounterStart(){
		return travelSheetRefFuelCounterStart;
	}

	public void setTravelSheetRefFuelCounterStart(BigDecimal travelSheetRefFuelCounterStart) {
		this.travelSheetRefFuelCounterStart = travelSheetRefFuelCounterStart;
	}

	public BigDecimal getTravelSheetRefFuelCounterFinal(){
		return travelSheetRefFuelCounterFinal;
	}

	public void setTravelSheetRefFuelCounterFinal(BigDecimal travelSheetRefFuelCounterFinal) {
		this.travelSheetRefFuelCounterFinal = travelSheetRefFuelCounterFinal;
	}

	public Date getTravelSheetRefTimeStart(){
		return travelSheetRefTimeStart;
	}

	public void setTravelSheetRefTimeStart(Date travelSheetRefTimeStart) {
		this.travelSheetRefTimeStart = travelSheetRefTimeStart;
	}

	public Date getTravelSheetRefTimeFinal(){
		return travelSheetRefTimeFinal;
	}

	public void setTravelSheetRefTimeFinal(Date travelSheetRefTimeFinal) {
		this.travelSheetRefTimeFinal = travelSheetRefTimeFinal;
	}

	public Date getTravelSheetRefDateEdit(){
		return travelSheetRefDateEdit;
	}

	public void setTravelSheetRefDateEdit(Date travelSheetRefDateEdit) {
		this.travelSheetRefDateEdit = travelSheetRefDateEdit;
	}

	public String getTravelSheetRefUserGen(){
		return travelSheetRefUserGen;
	}

	public void setTravelSheetRefUserGen(String travelSheetRefUserGen) {
		this.travelSheetRefUserGen = travelSheetRefUserGen;
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

	public int getTravelSheetFuelTypeRefCode(){
		return travelSheetFuelTypeRefCode;
	}

	public void setTravelSheetFuelTypeRefCode(int travelSheetFuelTypeRefCode) {
		this.travelSheetFuelTypeRefCode = travelSheetFuelTypeRefCode;
	}

	public String getTravelSheetFuelTypeRefName(){
		return travelSheetFuelTypeRefName;
	}

	public void setTravelSheetFuelTypeRefName(String travelSheetFuelTypeRefName) {
		this.travelSheetFuelTypeRefName = travelSheetFuelTypeRefName;
	}



}

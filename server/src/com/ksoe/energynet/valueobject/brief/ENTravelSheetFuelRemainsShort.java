
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2022 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTravelSheetFuelRemains;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENTravelSheetFuelRemainsShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public Date dateGen ;
	public BigDecimal countGenStart;
	public BigDecimal priceGenStart;
	public BigDecimal sumGenStart;
	public BigDecimal countGenIn;
	public BigDecimal priceGenIn;
	public BigDecimal sumGenIn;
	public BigDecimal countGenOut;
	public BigDecimal priceGenOut;
	public BigDecimal sumGenOut;
	public BigDecimal countGenFinal;
	public BigDecimal priceGenFinal;
	public BigDecimal sumGenFinal;
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
	public int fuelTypeRefCode = Integer.MIN_VALUE;
	public String fuelTypeRefName;
	public int realTransportCode = Integer.MIN_VALUE;
	public String realTransportName;
	public String realTransportInvNumber;
	public String realTransportGosNumber;
	public int travelSheetFuelTypeRefCode = Integer.MIN_VALUE;
	public String travelSheetFuelTypeRefName;


	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public Date getDateGen() {
		return dateGen;
	}

	public void setDateGen(Date dateGen) {
		this.dateGen = dateGen;
	}

	public BigDecimal getCountGenStart() {
		return countGenStart;
	}

	public void setCountGenStart(BigDecimal countGenStart) {
		this.countGenStart = countGenStart;
	}

	public BigDecimal getPriceGenStart() {
		return priceGenStart;
	}

	public void setPriceGenStart(BigDecimal priceGenStart) {
		this.priceGenStart = priceGenStart;
	}

	public BigDecimal getSumGenStart() {
		return sumGenStart;
	}

	public void setSumGenStart(BigDecimal sumGenStart) {
		this.sumGenStart = sumGenStart;
	}

	public BigDecimal getCountGenIn() {
		return countGenIn;
	}

	public void setCountGenIn(BigDecimal countGenIn) {
		this.countGenIn = countGenIn;
	}

	public BigDecimal getPriceGenIn() {
		return priceGenIn;
	}

	public void setPriceGenIn(BigDecimal priceGenIn) {
		this.priceGenIn = priceGenIn;
	}

	public BigDecimal getSumGenIn() {
		return sumGenIn;
	}

	public void setSumGenIn(BigDecimal sumGenIn) {
		this.sumGenIn = sumGenIn;
	}

	public BigDecimal getCountGenOut() {
		return countGenOut;
	}

	public void setCountGenOut(BigDecimal countGenOut) {
		this.countGenOut = countGenOut;
	}

	public BigDecimal getPriceGenOut() {
		return priceGenOut;
	}

	public void setPriceGenOut(BigDecimal priceGenOut) {
		this.priceGenOut = priceGenOut;
	}

	public BigDecimal getSumGenOut() {
		return sumGenOut;
	}

	public void setSumGenOut(BigDecimal sumGenOut) {
		this.sumGenOut = sumGenOut;
	}

	public BigDecimal getCountGenFinal() {
		return countGenFinal;
	}

	public void setCountGenFinal(BigDecimal countGenFinal) {
		this.countGenFinal = countGenFinal;
	}

	public BigDecimal getPriceGenFinal() {
		return priceGenFinal;
	}

	public void setPriceGenFinal(BigDecimal priceGenFinal) {
		this.priceGenFinal = priceGenFinal;
	}

	public BigDecimal getSumGenFinal() {
		return sumGenFinal;
	}

	public void setSumGenFinal(BigDecimal sumGenFinal) {
		this.sumGenFinal = sumGenFinal;
	}

	public Boolean getIsThirdParty() {
		return isThirdParty;
	}

    public boolean checkIsThirdParty() {
    	return this.isThirdParty != null && this.isThirdParty;
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

	public int getFuelTypeRefCode(){
		return fuelTypeRefCode;
	}

	public void setFuelTypeRefCode(int fuelTypeRefCode) {
		this.fuelTypeRefCode = fuelTypeRefCode;
	}

	public String getFuelTypeRefName(){
		return fuelTypeRefName;
	}

	public void setFuelTypeRefName(String fuelTypeRefName) {
		this.fuelTypeRefName = fuelTypeRefName;
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

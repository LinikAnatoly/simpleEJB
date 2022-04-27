
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENFuelInventarizationItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENFuelInventarizationItemShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal countGen;
    public BigDecimal countFact;
    public String userAdd;
    public Date dateAdd ;
    public String userGen;
    public Date dateEdit ;
    public int inventarizationRefCode = Integer.MIN_VALUE;
    public String inventarizationRefNumberGen;
    public Date inventarizationRefDateGen;
    public String inventarizationRefMolCode;
    public String inventarizationRefMolName;
    public String inventarizationRefCommentGen;
    public String inventarizationRefUserAdd;
    public Date inventarizationRefDateAdd;
    public String inventarizationRefUserGen;
    public Date inventarizationRefDateEdit;
    public int fuelTypeRefCode = Integer.MIN_VALUE;
    public String fuelTypeRefName;
    public int transportRealRefCode = Integer.MIN_VALUE;
    public String transportRealRefName;
    public String transportRealRefInvNumber;
    public String transportRealRefGosNumber;
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
    public int travelFuelTypeRefCode = Integer.MIN_VALUE;
    public String travelFuelTypeRefName;
	public BigDecimal reserved_fuel_in_next_period_quantity;
	public BigDecimal not_bounded_fuel_in_past_period;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setCountGen(BigDecimal aValue){
       countGen = aValue;
    }

    public BigDecimal getCountGen(){
       return countGen;
    }
    public void setCountFact(BigDecimal aValue){
       countFact = aValue;
    }

    public BigDecimal getCountFact(){
       return countFact;
    }
    public void setUserAdd(String aValue){
       userAdd = aValue;
    }

    public String getUserAdd(){
       return userAdd;
    }

    public void setDateAdd(Date aValue){
       dateAdd = aValue;
    }

    public Date getDateAdd(){
       return dateAdd;
    }
    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }

    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }


    public void setInventarizationRefCode(int aValue){
       inventarizationRefCode = aValue;
    }
    public int getInventarizationRefCode(){
       return inventarizationRefCode;
    }

    public void setInventarizationRefNumberGen(String aValue){
       inventarizationRefNumberGen = aValue;
    }
    public String getInventarizationRefNumberGen(){
       return inventarizationRefNumberGen;
    }


    public void setInventarizationRefDateGen(Date aValue){
       inventarizationRefDateGen = aValue;
    }
    public Date getInventarizationRefDateGen(){
       return inventarizationRefDateGen;
    }

    public void setInventarizationRefMolCode(String aValue){
       inventarizationRefMolCode = aValue;
    }
    public String getInventarizationRefMolCode(){
       return inventarizationRefMolCode;
    }

    public void setInventarizationRefMolName(String aValue){
       inventarizationRefMolName = aValue;
    }
    public String getInventarizationRefMolName(){
       return inventarizationRefMolName;
    }

    public void setInventarizationRefCommentGen(String aValue){
       inventarizationRefCommentGen = aValue;
    }
    public String getInventarizationRefCommentGen(){
       return inventarizationRefCommentGen;
    }

    public void setInventarizationRefUserAdd(String aValue){
       inventarizationRefUserAdd = aValue;
    }
    public String getInventarizationRefUserAdd(){
       return inventarizationRefUserAdd;
    }


    public void setInventarizationRefDateAdd(Date aValue){
       inventarizationRefDateAdd = aValue;
    }
    public Date getInventarizationRefDateAdd(){
       return inventarizationRefDateAdd;
    }

    public void setInventarizationRefUserGen(String aValue){
       inventarizationRefUserGen = aValue;
    }
    public String getInventarizationRefUserGen(){
       return inventarizationRefUserGen;
    }


    public void setInventarizationRefDateEdit(Date aValue){
       inventarizationRefDateEdit = aValue;
    }
    public Date getInventarizationRefDateEdit(){
       return inventarizationRefDateEdit;
    }

    public void setFuelTypeRefCode(int aValue){
       fuelTypeRefCode = aValue;
    }
    public int getFuelTypeRefCode(){
       return fuelTypeRefCode;
    }

    public void setFuelTypeRefName(String aValue){
       fuelTypeRefName = aValue;
    }
    public String getFuelTypeRefName(){
       return fuelTypeRefName;
    }

    public void setTransportRealRefCode(int aValue){
       transportRealRefCode = aValue;
    }
    public int getTransportRealRefCode(){
       return transportRealRefCode;
    }

    public void setTransportRealRefName(String aValue){
       transportRealRefName = aValue;
    }
    public String getTransportRealRefName(){
       return transportRealRefName;
    }

    public void setTransportRealRefInvNumber(String aValue){
       transportRealRefInvNumber = aValue;
    }
    public String getTransportRealRefInvNumber(){
       return transportRealRefInvNumber;
    }

    public void setTransportRealRefGosNumber(String aValue){
       transportRealRefGosNumber = aValue;
    }
    public String getTransportRealRefGosNumber(){
       return transportRealRefGosNumber;
    }

    public void setTravelSheetRefCode(int aValue){
       travelSheetRefCode = aValue;
    }
    public int getTravelSheetRefCode(){
       return travelSheetRefCode;
    }

    public void setTravelSheetRefNumberGen(String aValue){
       travelSheetRefNumberGen = aValue;
    }
    public String getTravelSheetRefNumberGen(){
       return travelSheetRefNumberGen;
    }


    public void setTravelSheetRefDateStart(Date aValue){
       travelSheetRefDateStart = aValue;
    }
    public Date getTravelSheetRefDateStart(){
       return travelSheetRefDateStart;
    }


    public void setTravelSheetRefDateFinal(Date aValue){
       travelSheetRefDateFinal = aValue;
    }
    public Date getTravelSheetRefDateFinal(){
       return travelSheetRefDateFinal;
    }

    public void setTravelSheetRefSpeedometerStart(BigDecimal aValue){
       travelSheetRefSpeedometerStart = aValue;
    }
    public BigDecimal getTravelSheetRefSpeedometerStart(){
       return travelSheetRefSpeedometerStart;
    }

    public void setTravelSheetRefSpeedometerFinal(BigDecimal aValue){
       travelSheetRefSpeedometerFinal = aValue;
    }
    public BigDecimal getTravelSheetRefSpeedometerFinal(){
       return travelSheetRefSpeedometerFinal;
    }

    public void setTravelSheetRefFuelCounterStart(BigDecimal aValue){
       travelSheetRefFuelCounterStart = aValue;
    }
    public BigDecimal getTravelSheetRefFuelCounterStart(){
       return travelSheetRefFuelCounterStart;
    }

    public void setTravelSheetRefFuelCounterFinal(BigDecimal aValue){
       travelSheetRefFuelCounterFinal = aValue;
    }
    public BigDecimal getTravelSheetRefFuelCounterFinal(){
       return travelSheetRefFuelCounterFinal;
    }


    public void setTravelSheetRefTimeStart(Date aValue){
       travelSheetRefTimeStart = aValue;
    }
    public Date getTravelSheetRefTimeStart(){
       return travelSheetRefTimeStart;
    }


    public void setTravelSheetRefTimeFinal(Date aValue){
       travelSheetRefTimeFinal = aValue;
    }
    public Date getTravelSheetRefTimeFinal(){
       return travelSheetRefTimeFinal;
    }


    public void setTravelSheetRefDateEdit(Date aValue){
       travelSheetRefDateEdit = aValue;
    }
    public Date getTravelSheetRefDateEdit(){
       return travelSheetRefDateEdit;
    }

    public void setTravelSheetRefUserGen(String aValue){
       travelSheetRefUserGen = aValue;
    }
    public String getTravelSheetRefUserGen(){
       return travelSheetRefUserGen;
    }

    public void setTravelFuelTypeRefCode(int aValue){
       travelFuelTypeRefCode = aValue;
    }
    public int getTravelFuelTypeRefCode(){
       return travelFuelTypeRefCode;
    }

    public void setTravelFuelTypeRefName(String aValue){
       travelFuelTypeRefName = aValue;
    }
    public String getTravelFuelTypeRefName(){
       return travelFuelTypeRefName;
    }

    public BigDecimal getReserved_fuel_in_next_period_quantity() {
		return reserved_fuel_in_next_period_quantity;
	}

	public void setReserved_fuel_in_next_period_quantity(
			BigDecimal reserved_fuel_in_next_period_quantity) {
		this.reserved_fuel_in_next_period_quantity = reserved_fuel_in_next_period_quantity;
	}

	public BigDecimal getNot_bounded_fuel_in_past_period() {
		return not_bounded_fuel_in_past_period;
	}

	public void setNot_bounded_fuel_in_past_period(
			BigDecimal not_bounded_fuel_in_past_period) {
		this.not_bounded_fuel_in_past_period = not_bounded_fuel_in_past_period;
	}
	
}
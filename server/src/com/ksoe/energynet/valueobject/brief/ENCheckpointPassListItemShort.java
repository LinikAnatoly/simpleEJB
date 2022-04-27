
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENCheckpointPassListItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENCheckpointPassListItemShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public Date dateEvent ;
    public String userGen;
    public Date dateEdit ;
    public int transportRealRefCode = Integer.MIN_VALUE;
    public String transportRealRefName;
    public String transportRealRefInvNumber;
    public String transportRealRefGosNumber;
    public int checkpointPassListRefCode = Integer.MIN_VALUE;
    public Date checkpointPassListRefDateStart;
    public Date checkpointPassListRefDateFinal;
    public String checkpointPassListRefUserGen;
    public Date checkpointPassListRefDateEdit;
    public int eventTypeRefCode = Integer.MIN_VALUE;
    public String eventTypeRefName;
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
    
	public String checkpointName;
    
    public String getCheckpointName() {
		return checkpointName;
	}

	public void setCheckpointName(String checkpointName) {
		this.checkpointName = checkpointName;
	}

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setDateEvent(Date aValue){
       dateEvent = aValue;
    }

    public Date getDateEvent(){
       return dateEvent;
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

    public void setCheckpointPassListRefCode(int aValue){
       checkpointPassListRefCode = aValue;
    }
    public int getCheckpointPassListRefCode(){
       return checkpointPassListRefCode;
    }

    public void setCheckpointPassListRefDateStart(Date aValue){
       checkpointPassListRefDateStart = aValue;
    }
    public Date getCheckpointPassListRefDateStart(){
       return checkpointPassListRefDateStart;
    }

    public void setCheckpointPassListRefDateFinal(Date aValue){
       checkpointPassListRefDateFinal = aValue;
    }
    public Date getCheckpointPassListRefDateFinal(){
       return checkpointPassListRefDateFinal;
    }

    public void setCheckpointPassListRefUserGen(String aValue){
       checkpointPassListRefUserGen = aValue;
    }
    public String getCheckpointPassListRefUserGen(){
       return checkpointPassListRefUserGen;
    }

    public void setCheckpointPassListRefDateEdit(Date aValue){
       checkpointPassListRefDateEdit = aValue;
    }
    public Date getCheckpointPassListRefDateEdit(){
       return checkpointPassListRefDateEdit;
    }

    public void setEventTypeRefCode(int aValue){
       eventTypeRefCode = aValue;
    }
    public int getEventTypeRefCode(){
       return eventTypeRefCode;
    }

    public void setEventTypeRefName(String aValue){
       eventTypeRefName = aValue;
    }
    public String getEventTypeRefName(){
       return eventTypeRefName;
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



}
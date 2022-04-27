
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTravelSheet;
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENTravelSheetShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String numberGen;
    public Date dateStart ;
    public Date dateFinal ;
    public BigDecimal speedometerStart;
    public BigDecimal speedometerFinal;
    public BigDecimal fuelCounterStart;
    public BigDecimal fuelCounterFinal;
    public Date timeStart ;
    public Date timeFinal ;
    public Date dateEdit ;
    public String userGen;
    public int isPrinted = Integer.MIN_VALUE;
    public int departmentCode = Integer.MIN_VALUE;
    public String departmentShortName;
    public Date departmentDateStart;
    public Date departmentDateFinal;
    public int departmentRenCode = Integer.MIN_VALUE;
    public String departmentShpzBalans;
    public int departmentKau_table_id_1884 = Integer.MIN_VALUE;
    public String departmentKau_1884;
    public String departmentName_1884;
    public int transportRealCode = Integer.MIN_VALUE;
    public String transportRealName;
    public String transportRealInvNumber;
    public String transportRealGosNumber;
    public int trailer1Code = Integer.MIN_VALUE;
    public String trailer1Name;
    public String trailer1InvNumber;
    public String trailer1GosNumber;
    public int trailer2Code = Integer.MIN_VALUE;
    public String trailer2Name;
    public String trailer2InvNumber;
    public String trailer2GosNumber;
    public int finWorkerCode = Integer.MIN_VALUE;
    public String finWorkerName;
    public String finWorkerTabNumber;
    public String finWorkerPositionName;
    public int finWorkerPositionCode = Integer.MIN_VALUE;
    public String finWorkerDepartmentName;
    public String finWorkerDepartmentCode;
    public BigDecimal finWorkerPriceGen;
    public int finWorkerCategor = Integer.MIN_VALUE;
    public int finWorkerFinCode = Integer.MIN_VALUE;
    public int finWorkerIsSentAssignment = Integer.MIN_VALUE;
    public BigDecimal finWorkerChargePercent;
    public int finWorker_additional_1Code = Integer.MIN_VALUE;
    public String finWorker_additional_1Name;
    public int finWorker_additional_1TabNumber = Integer.MIN_VALUE;
    public String finWorker_additional_1PositionName;
    public int finWorker_additional_1PositionCode = Integer.MIN_VALUE;
    public String finWorker_additional_1DepartmentName;
    public String finWorker_additional_1DepartmentCode;
    public BigDecimal finWorker_additional_1PriceGen;
    public int finWorker_additional_1Categor = Integer.MIN_VALUE;
    public int finWorker_additional_1FinCode = Integer.MIN_VALUE;
    public int finWorker_additional_1IsSentAssignment = Integer.MIN_VALUE;
    public BigDecimal finWorker_additional_1ChargePercent;
    public int finWorker_additional_2Code = Integer.MIN_VALUE;
    public String finWorker_additional_2Name;
    public int finWorker_additional_2TabNumber = Integer.MIN_VALUE;
    public String finWorker_additional_2PositionName;
    public int finWorker_additional_2PositionCode = Integer.MIN_VALUE;
    public String finWorker_additional_2DepartmentName;
    public String finWorker_additional_2DepartmentCode;
    public BigDecimal finWorker_additional_2PriceGen;
    public int finWorker_additional_2Categor = Integer.MIN_VALUE;
    public int finWorker_additional_2FinCode = Integer.MIN_VALUE;
    public int finWorker_additional_2IsSentAssignment = Integer.MIN_VALUE;
    public BigDecimal finWorker_additional_2ChargePercent;
    public int workModeRefCode = Integer.MIN_VALUE;
    public String workModeRefName;
    public int typeRefCode = Integer.MIN_VALUE;
    public String typeRefName;
    public int statusRefCode = Integer.MIN_VALUE;
    public String statusRefName;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setNumberGen(String aValue){
       numberGen = aValue;
    }

    public String getNumberGen(){
       return numberGen;
    }

    public void setDateStart(Date aValue){
       dateStart = aValue;
    }

    public Date getDateStart(){
       return dateStart;
    }

    public void setDateFinal(Date aValue){
       dateFinal = aValue;
    }

    public Date getDateFinal(){
       return dateFinal;
    }
    public void setSpeedometerStart(BigDecimal aValue){
       speedometerStart = aValue;
    }

    public BigDecimal getSpeedometerStart(){
       return speedometerStart;
    }
    public void setSpeedometerFinal(BigDecimal aValue){
       speedometerFinal = aValue;
    }

    public BigDecimal getSpeedometerFinal(){
       return speedometerFinal;
    }
    public void setFuelCounterStart(BigDecimal aValue){
       fuelCounterStart = aValue;
    }

    public BigDecimal getFuelCounterStart(){
       return fuelCounterStart;
    }
    public void setFuelCounterFinal(BigDecimal aValue){
       fuelCounterFinal = aValue;
    }

    public BigDecimal getFuelCounterFinal(){
       return fuelCounterFinal;
    }

    public void setTimeStart(Date aValue){
       timeStart = aValue;
    }

    public Date getTimeStart(){
       return timeStart;
    }

    public void setTimeFinal(Date aValue){
       timeFinal = aValue;
    }

    public Date getTimeFinal(){
       return timeFinal;
    }

    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }
    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }
    public void setIsPrinted(int aValue){
       isPrinted = aValue;
    }

    public int getIsPrinted(){
       return isPrinted;
    }


    public void setDepartmentCode(int aValue){
       departmentCode = aValue;
    }
    public int getDepartmentCode(){
       return departmentCode;
    }

    public void setDepartmentShortName(String aValue){
       departmentShortName = aValue;
    }
    public String getDepartmentShortName(){
       return departmentShortName;
    }


    public void setDepartmentDateStart(Date aValue){
       departmentDateStart = aValue;
    }
    public Date getDepartmentDateStart(){
       return departmentDateStart;
    }


    public void setDepartmentDateFinal(Date aValue){
       departmentDateFinal = aValue;
    }
    public Date getDepartmentDateFinal(){
       return departmentDateFinal;
    }

    public void setDepartmentRenCode(int aValue){
       departmentRenCode = aValue;
    }
    public int getDepartmentRenCode(){
       return departmentRenCode;
    }

    public void setDepartmentShpzBalans(String aValue){
       departmentShpzBalans = aValue;
    }
    public String getDepartmentShpzBalans(){
       return departmentShpzBalans;
    }

    public void setDepartmentKau_table_id_1884(int aValue){
       departmentKau_table_id_1884 = aValue;
    }
    public int getDepartmentKau_table_id_1884(){
       return departmentKau_table_id_1884;
    }

    public void setDepartmentKau_1884(String aValue){
       departmentKau_1884 = aValue;
    }
    public String getDepartmentKau_1884(){
       return departmentKau_1884;
    }

    public void setDepartmentName_1884(String aValue){
       departmentName_1884 = aValue;
    }
    public String getDepartmentName_1884(){
       return departmentName_1884;
    }

    public void setTransportRealCode(int aValue){
       transportRealCode = aValue;
    }
    public int getTransportRealCode(){
       return transportRealCode;
    }

    public void setTransportRealName(String aValue){
       transportRealName = aValue;
    }
    public String getTransportRealName(){
       return transportRealName;
    }

    public void setTransportRealInvNumber(String aValue){
       transportRealInvNumber = aValue;
    }
    public String getTransportRealInvNumber(){
       return transportRealInvNumber;
    }

    public void setTransportRealGosNumber(String aValue){
       transportRealGosNumber = aValue;
    }
    public String getTransportRealGosNumber(){
       return transportRealGosNumber;
    }

    public void setTrailer1Code(int aValue){
       trailer1Code = aValue;
    }
    public int getTrailer1Code(){
       return trailer1Code;
    }

    public void setTrailer1Name(String aValue){
       trailer1Name = aValue;
    }
    public String getTrailer1Name(){
       return trailer1Name;
    }

    public void setTrailer1InvNumber(String aValue){
       trailer1InvNumber = aValue;
    }
    public String getTrailer1InvNumber(){
       return trailer1InvNumber;
    }

    public void setTrailer1GosNumber(String aValue){
       trailer1GosNumber = aValue;
    }
    public String getTrailer1GosNumber(){
       return trailer1GosNumber;
    }

    public void setTrailer2Code(int aValue){
       trailer2Code = aValue;
    }
    public int getTrailer2Code(){
       return trailer2Code;
    }

    public void setTrailer2Name(String aValue){
       trailer2Name = aValue;
    }
    public String getTrailer2Name(){
       return trailer2Name;
    }

    public void setTrailer2InvNumber(String aValue){
       trailer2InvNumber = aValue;
    }
    public String getTrailer2InvNumber(){
       return trailer2InvNumber;
    }

    public void setTrailer2GosNumber(String aValue){
       trailer2GosNumber = aValue;
    }
    public String getTrailer2GosNumber(){
       return trailer2GosNumber;
    }

    public void setFinWorkerCode(int aValue){
       finWorkerCode = aValue;
    }
    public int getFinWorkerCode(){
       return finWorkerCode;
    }

    public void setFinWorkerName(String aValue){
       finWorkerName = aValue;
    }
    public String getFinWorkerName(){
       return finWorkerName;
    }

    public void setFinWorkerTabNumber(String aValue){
       finWorkerTabNumber = aValue;
    }
    public String getFinWorkerTabNumber(){
       return finWorkerTabNumber;
    }

    public void setFinWorkerPositionName(String aValue){
       finWorkerPositionName = aValue;
    }
    public String getFinWorkerPositionName(){
       return finWorkerPositionName;
    }

    public void setFinWorkerPositionCode(int aValue){
       finWorkerPositionCode = aValue;
    }
    public int getFinWorkerPositionCode(){
       return finWorkerPositionCode;
    }

    public void setFinWorkerDepartmentName(String aValue){
       finWorkerDepartmentName = aValue;
    }
    public String getFinWorkerDepartmentName(){
       return finWorkerDepartmentName;
    }

    public void setFinWorkerDepartmentCode(String aValue){
       finWorkerDepartmentCode = aValue;
    }
    public String getFinWorkerDepartmentCode(){
       return finWorkerDepartmentCode;
    }

    public void setFinWorkerPriceGen(BigDecimal aValue){
       finWorkerPriceGen = aValue;
    }
    public BigDecimal getFinWorkerPriceGen(){
       return finWorkerPriceGen;
    }

    public void setFinWorkerCategor(int aValue){
       finWorkerCategor = aValue;
    }
    public int getFinWorkerCategor(){
       return finWorkerCategor;
    }

    public void setFinWorkerFinCode(int aValue){
       finWorkerFinCode = aValue;
    }
    public int getFinWorkerFinCode(){
       return finWorkerFinCode;
    }

    public void setFinWorkerIsSentAssignment(int aValue){
       finWorkerIsSentAssignment = aValue;
    }
    public int getFinWorkerIsSentAssignment(){
       return finWorkerIsSentAssignment;
    }

    public void setFinWorkerChargePercent(BigDecimal aValue){
       finWorkerChargePercent = aValue;
    }
    public BigDecimal getFinWorkerChargePercent(){
       return finWorkerChargePercent;
    }

    public void setFinWorker_additional_1Code(int aValue){
       finWorker_additional_1Code = aValue;
    }
    public int getFinWorker_additional_1Code(){
       return finWorker_additional_1Code;
    }

    public void setFinWorker_additional_1Name(String aValue){
       finWorker_additional_1Name = aValue;
    }
    public String getFinWorker_additional_1Name(){
       return finWorker_additional_1Name;
    }

    public void setFinWorker_additional_1TabNumber(int aValue){
       finWorker_additional_1TabNumber = aValue;
    }
    public int getFinWorker_additional_1TabNumber(){
       return finWorker_additional_1TabNumber;
    }

    public void setFinWorker_additional_1PositionName(String aValue){
       finWorker_additional_1PositionName = aValue;
    }
    public String getFinWorker_additional_1PositionName(){
       return finWorker_additional_1PositionName;
    }

    public void setFinWorker_additional_1PositionCode(int aValue){
       finWorker_additional_1PositionCode = aValue;
    }
    public int getFinWorker_additional_1PositionCode(){
       return finWorker_additional_1PositionCode;
    }

    public void setFinWorker_additional_1DepartmentName(String aValue){
       finWorker_additional_1DepartmentName = aValue;
    }
    public String getFinWorker_additional_1DepartmentName(){
       return finWorker_additional_1DepartmentName;
    }

    public void setFinWorker_additional_1DepartmentCode(String aValue){
       finWorker_additional_1DepartmentCode = aValue;
    }
    public String getFinWorker_additional_1DepartmentCode(){
       return finWorker_additional_1DepartmentCode;
    }

    public void setFinWorker_additional_1PriceGen(BigDecimal aValue){
       finWorker_additional_1PriceGen = aValue;
    }
    public BigDecimal getFinWorker_additional_1PriceGen(){
       return finWorker_additional_1PriceGen;
    }

    public void setFinWorker_additional_1Categor(int aValue){
       finWorker_additional_1Categor = aValue;
    }
    public int getFinWorker_additional_1Categor(){
       return finWorker_additional_1Categor;
    }

    public void setFinWorker_additional_1FinCode(int aValue){
       finWorker_additional_1FinCode = aValue;
    }
    public int getFinWorker_additional_1FinCode(){
       return finWorker_additional_1FinCode;
    }

    public void setFinWorker_additional_1IsSentAssignment(int aValue){
       finWorker_additional_1IsSentAssignment = aValue;
    }
    public int getFinWorker_additional_1IsSentAssignment(){
       return finWorker_additional_1IsSentAssignment;
    }

    public void setFinWorker_additional_1ChargePercent(BigDecimal aValue){
       finWorker_additional_1ChargePercent = aValue;
    }
    public BigDecimal getFinWorker_additional_1ChargePercent(){
       return finWorker_additional_1ChargePercent;
    }

    public void setFinWorker_additional_2Code(int aValue){
       finWorker_additional_2Code = aValue;
    }
    public int getFinWorker_additional_2Code(){
       return finWorker_additional_2Code;
    }

    public void setFinWorker_additional_2Name(String aValue){
       finWorker_additional_2Name = aValue;
    }
    public String getFinWorker_additional_2Name(){
       return finWorker_additional_2Name;
    }

    public void setFinWorker_additional_2TabNumber(int aValue){
       finWorker_additional_2TabNumber = aValue;
    }
    public int getFinWorker_additional_2TabNumber(){
       return finWorker_additional_2TabNumber;
    }

    public void setFinWorker_additional_2PositionName(String aValue){
       finWorker_additional_2PositionName = aValue;
    }
    public String getFinWorker_additional_2PositionName(){
       return finWorker_additional_2PositionName;
    }

    public void setFinWorker_additional_2PositionCode(int aValue){
       finWorker_additional_2PositionCode = aValue;
    }
    public int getFinWorker_additional_2PositionCode(){
       return finWorker_additional_2PositionCode;
    }

    public void setFinWorker_additional_2DepartmentName(String aValue){
       finWorker_additional_2DepartmentName = aValue;
    }
    public String getFinWorker_additional_2DepartmentName(){
       return finWorker_additional_2DepartmentName;
    }

    public void setFinWorker_additional_2DepartmentCode(String aValue){
       finWorker_additional_2DepartmentCode = aValue;
    }
    public String getFinWorker_additional_2DepartmentCode(){
       return finWorker_additional_2DepartmentCode;
    }

    public void setFinWorker_additional_2PriceGen(BigDecimal aValue){
       finWorker_additional_2PriceGen = aValue;
    }
    public BigDecimal getFinWorker_additional_2PriceGen(){
       return finWorker_additional_2PriceGen;
    }

    public void setFinWorker_additional_2Categor(int aValue){
       finWorker_additional_2Categor = aValue;
    }
    public int getFinWorker_additional_2Categor(){
       return finWorker_additional_2Categor;
    }

    public void setFinWorker_additional_2FinCode(int aValue){
       finWorker_additional_2FinCode = aValue;
    }
    public int getFinWorker_additional_2FinCode(){
       return finWorker_additional_2FinCode;
    }

    public void setFinWorker_additional_2IsSentAssignment(int aValue){
       finWorker_additional_2IsSentAssignment = aValue;
    }
    public int getFinWorker_additional_2IsSentAssignment(){
       return finWorker_additional_2IsSentAssignment;
    }

    public void setFinWorker_additional_2ChargePercent(BigDecimal aValue){
       finWorker_additional_2ChargePercent = aValue;
    }
    public BigDecimal getFinWorker_additional_2ChargePercent(){
       return finWorker_additional_2ChargePercent;
    }

    public void setWorkModeRefCode(int aValue){
       workModeRefCode = aValue;
    }
    public int getWorkModeRefCode(){
       return workModeRefCode;
    }

    public void setWorkModeRefName(String aValue){
       workModeRefName = aValue;
    }
    public String getWorkModeRefName(){
       return workModeRefName;
    }

    public void setTypeRefCode(int aValue){
       typeRefCode = aValue;
    }
    public int getTypeRefCode(){
       return typeRefCode;
    }

    public void setTypeRefName(String aValue){
       typeRefName = aValue;
    }
    public String getTypeRefName(){
       return typeRefName;
    }

    public void setStatusRefCode(int aValue){
       statusRefCode = aValue;
    }
    public int getStatusRefCode(){
       return statusRefCode;
    }

    public void setStatusRefName(String aValue){
       statusRefName = aValue;
    }
    public String getStatusRefName(){
       return statusRefName;
    }



}

//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTravelSheetFuel2FINMaterials;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENTravelSheetFuel2FINMaterialsShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String userGen;
    public Date dateEdit ;
    public int travelSheetFuelRefCode = Integer.MIN_VALUE;
    public BigDecimal travelSheetFuelRefCountGen;
    public String travelSheetFuelRefSeries;
    public String travelSheetFuelRefNumbers;
    public Date travelSheetFuelRefDateGen;
    public int travelSheetFuelRefIsVRTU = Integer.MIN_VALUE;
    public int finMaterialsRefCode = Integer.MIN_VALUE;
    public String finMaterialsRefNn;
    public String finMaterialsRefMat_name;
    public String finMaterialsRefMu_name;
    public String finMaterialsRefDiv_name;
    public int finMaterialsRefParty_id = Integer.MIN_VALUE;
    public String finMaterialsRefPartner_name;
    public Date finMaterialsRefDoc_date;
    public String finMaterialsRefParty_discription;
    public int finMaterialsRefRest_purpose_id = Integer.MIN_VALUE;
    public String finMaterialsRefRest_purpose_name;
    public int finMaterialsRefRest_purpose_type_id = Integer.MIN_VALUE;
    public int finMaterialsRefBudget_core_id = Integer.MIN_VALUE;
    public int finMaterialsRefFrc_code = Integer.MIN_VALUE;
    public String finMaterialsRefFrc_name;
    public BigDecimal finMaterialsRefCalc_price;
    public BigDecimal finMaterialsRefQuantity;
    public BigDecimal finMaterialsRefPrice;
    public BigDecimal finMaterialsRefCost;
    public String finMaterialsRefBal_sch;
    public BigDecimal finMaterialsRefFullQuantity;
    public BigDecimal finMaterialsRefFullCost;
    public Date finMaterialsRefWear_date;
    public String finMaterialsRefUserGen;
    public Date finMaterialsRefDateEdit;
    public BigDecimal finMaterialsRefExtra_cargo;
    public BigDecimal finMaterialsRefCost_ext;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
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


    public void setTravelSheetFuelRefCode(int aValue){
       travelSheetFuelRefCode = aValue;
    }
    public int getTravelSheetFuelRefCode(){
       return travelSheetFuelRefCode;
    }

    public void setTravelSheetFuelRefCountGen(BigDecimal aValue){
       travelSheetFuelRefCountGen = aValue;
    }
    public BigDecimal getTravelSheetFuelRefCountGen(){
       return travelSheetFuelRefCountGen;
    }

    public void setTravelSheetFuelRefSeries(String aValue){
       travelSheetFuelRefSeries = aValue;
    }
    public String getTravelSheetFuelRefSeries(){
       return travelSheetFuelRefSeries;
    }

    public void setTravelSheetFuelRefNumbers(String aValue){
       travelSheetFuelRefNumbers = aValue;
    }
    public String getTravelSheetFuelRefNumbers(){
       return travelSheetFuelRefNumbers;
    }


    public void setTravelSheetFuelRefDateGen(Date aValue){
       travelSheetFuelRefDateGen = aValue;
    }
    public Date getTravelSheetFuelRefDateGen(){
       return travelSheetFuelRefDateGen;
    }

    public void setTravelSheetFuelRefIsVRTU(int aValue){
       travelSheetFuelRefIsVRTU = aValue;
    }
    public int getTravelSheetFuelRefIsVRTU(){
       return travelSheetFuelRefIsVRTU;
    }

    public void setFinMaterialsRefCode(int aValue){
       finMaterialsRefCode = aValue;
    }
    public int getFinMaterialsRefCode(){
       return finMaterialsRefCode;
    }

    public void setFinMaterialsRefNn(String aValue){
       finMaterialsRefNn = aValue;
    }
    public String getFinMaterialsRefNn(){
       return finMaterialsRefNn;
    }

    public void setFinMaterialsRefMat_name(String aValue){
       finMaterialsRefMat_name = aValue;
    }
    public String getFinMaterialsRefMat_name(){
       return finMaterialsRefMat_name;
    }

    public void setFinMaterialsRefMu_name(String aValue){
       finMaterialsRefMu_name = aValue;
    }
    public String getFinMaterialsRefMu_name(){
       return finMaterialsRefMu_name;
    }

    public void setFinMaterialsRefDiv_name(String aValue){
       finMaterialsRefDiv_name = aValue;
    }
    public String getFinMaterialsRefDiv_name(){
       return finMaterialsRefDiv_name;
    }

    public void setFinMaterialsRefParty_id(int aValue){
       finMaterialsRefParty_id = aValue;
    }
    public int getFinMaterialsRefParty_id(){
       return finMaterialsRefParty_id;
    }

    public void setFinMaterialsRefPartner_name(String aValue){
       finMaterialsRefPartner_name = aValue;
    }
    public String getFinMaterialsRefPartner_name(){
       return finMaterialsRefPartner_name;
    }


    public void setFinMaterialsRefDoc_date(Date aValue){
       finMaterialsRefDoc_date = aValue;
    }
    public Date getFinMaterialsRefDoc_date(){
       return finMaterialsRefDoc_date;
    }

    public void setFinMaterialsRefParty_discription(String aValue){
       finMaterialsRefParty_discription = aValue;
    }
    public String getFinMaterialsRefParty_discription(){
       return finMaterialsRefParty_discription;
    }

    public void setFinMaterialsRefRest_purpose_id(int aValue){
       finMaterialsRefRest_purpose_id = aValue;
    }
    public int getFinMaterialsRefRest_purpose_id(){
       return finMaterialsRefRest_purpose_id;
    }

    public void setFinMaterialsRefRest_purpose_name(String aValue){
       finMaterialsRefRest_purpose_name = aValue;
    }
    public String getFinMaterialsRefRest_purpose_name(){
       return finMaterialsRefRest_purpose_name;
    }

    public void setFinMaterialsRefRest_purpose_type_id(int aValue){
       finMaterialsRefRest_purpose_type_id = aValue;
    }
    public int getFinMaterialsRefRest_purpose_type_id(){
       return finMaterialsRefRest_purpose_type_id;
    }

    public void setFinMaterialsRefBudget_core_id(int aValue){
       finMaterialsRefBudget_core_id = aValue;
    }
    public int getFinMaterialsRefBudget_core_id(){
       return finMaterialsRefBudget_core_id;
    }

    public void setFinMaterialsRefFrc_code(int aValue){
       finMaterialsRefFrc_code = aValue;
    }
    public int getFinMaterialsRefFrc_code(){
       return finMaterialsRefFrc_code;
    }

    public void setFinMaterialsRefFrc_name(String aValue){
       finMaterialsRefFrc_name = aValue;
    }
    public String getFinMaterialsRefFrc_name(){
       return finMaterialsRefFrc_name;
    }

    public void setFinMaterialsRefCalc_price(BigDecimal aValue){
       finMaterialsRefCalc_price = aValue;
    }
    public BigDecimal getFinMaterialsRefCalc_price(){
       return finMaterialsRefCalc_price;
    }

    public void setFinMaterialsRefQuantity(BigDecimal aValue){
       finMaterialsRefQuantity = aValue;
    }
    public BigDecimal getFinMaterialsRefQuantity(){
       return finMaterialsRefQuantity;
    }

    public void setFinMaterialsRefPrice(BigDecimal aValue){
       finMaterialsRefPrice = aValue;
    }
    public BigDecimal getFinMaterialsRefPrice(){
       return finMaterialsRefPrice;
    }

    public void setFinMaterialsRefCost(BigDecimal aValue){
       finMaterialsRefCost = aValue;
    }
    public BigDecimal getFinMaterialsRefCost(){
       return finMaterialsRefCost;
    }

    public void setFinMaterialsRefBal_sch(String aValue){
       finMaterialsRefBal_sch = aValue;
    }
    public String getFinMaterialsRefBal_sch(){
       return finMaterialsRefBal_sch;
    }

    public void setFinMaterialsRefFullQuantity(BigDecimal aValue){
       finMaterialsRefFullQuantity = aValue;
    }
    public BigDecimal getFinMaterialsRefFullQuantity(){
       return finMaterialsRefFullQuantity;
    }

    public void setFinMaterialsRefFullCost(BigDecimal aValue){
       finMaterialsRefFullCost = aValue;
    }
    public BigDecimal getFinMaterialsRefFullCost(){
       return finMaterialsRefFullCost;
    }


    public void setFinMaterialsRefWear_date(Date aValue){
       finMaterialsRefWear_date = aValue;
    }
    public Date getFinMaterialsRefWear_date(){
       return finMaterialsRefWear_date;
    }

    public void setFinMaterialsRefUserGen(String aValue){
       finMaterialsRefUserGen = aValue;
    }
    public String getFinMaterialsRefUserGen(){
       return finMaterialsRefUserGen;
    }


    public void setFinMaterialsRefDateEdit(Date aValue){
       finMaterialsRefDateEdit = aValue;
    }
    public Date getFinMaterialsRefDateEdit(){
       return finMaterialsRefDateEdit;
    }

    public void setFinMaterialsRefExtra_cargo(BigDecimal aValue){
       finMaterialsRefExtra_cargo = aValue;
    }
    public BigDecimal getFinMaterialsRefExtra_cargo(){
       return finMaterialsRefExtra_cargo;
    }

    public void setFinMaterialsRefCost_ext(BigDecimal aValue){
       finMaterialsRefCost_ext = aValue;
    }
    public BigDecimal getFinMaterialsRefCost_ext(){
       return finMaterialsRefCost_ext;
    }



}

//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTCOValues;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENTCOValuesShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String description;
	public int techconditionsobjectsCode = Integer.MIN_VALUE;
	public String techconditionsobjectsNumberGen;
	public Date techconditionsobjectsDateGen;
	public String techconditionsobjectsCustomer;
	public String techconditionsobjectsBuilding;
	public String techconditionsobjectsAddress;
	public BigDecimal techconditionsobjectsTyCurrentPower;
	public BigDecimal techconditionsobjectsTyServicesPower;
	public String techconditionsobjectsConnectionPowerPlaces;
	public String techconditionsobjectsConnectionPowerPlacesNum;
	public String techconditionsobjectsConnectionPowerPoint;
	public String techconditionsobjectsConnectionPowerPointNum;
	public String techconditionsobjectsConnectionSource;
	public String techconditionsobjectsConnectionSourceNum;
	public BigDecimal techconditionsobjectsCat1CurrentPower;
	public BigDecimal techconditionsobjectsCat2CurrentPower;
	public BigDecimal techconditionsobjectsCat3CurrentPower;
	public BigDecimal techconditionsobjectsCat1ServicesPower;
	public BigDecimal techconditionsobjectsCat2ServicesPower;
	public BigDecimal techconditionsobjectsCat3ServicesPower;
	public BigDecimal techconditionsobjectsTyServicesPowerWaterHeating;
	public BigDecimal techconditionsobjectsTyServicesPowerHeating;
	public BigDecimal techconditionsobjectsTyServicesPowerCooker;
	public BigDecimal techconditionsobjectsPowerGeneration;
	public int techconditionsobjectsYearGen = Integer.MIN_VALUE;
	public String techconditionsobjectsPerformer;
	public String techconditionsobjectsPerformerPhone;
	public String techconditionsobjectsUserGen;
	public Date techconditionsobjectsDateEdit;
	public int tcoValuesTypeCode = Integer.MIN_VALUE;
	public String tcoValuesTypeName;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setDescription(String aValue){
		description = aValue;
	}

	public String getDescription(){
		return description;
	}


	public void setTechconditionsobjectsCode(int aValue){
		techconditionsobjectsCode = aValue;
	}
	public int getTechconditionsobjectsCode(){
		return techconditionsobjectsCode;
	}

	public void setTechconditionsobjectsNumberGen(String aValue){
		techconditionsobjectsNumberGen = aValue;
	}
	public String getTechconditionsobjectsNumberGen(){
		return techconditionsobjectsNumberGen;
	}

	public void setTechconditionsobjectsDateGen(Date aValue){
		techconditionsobjectsDateGen = aValue;
	}
	public Date getTechconditionsobjectsDateGen(){
		return techconditionsobjectsDateGen;
	}

	public void setTechconditionsobjectsCustomer(String aValue){
		techconditionsobjectsCustomer = aValue;
	}
	public String getTechconditionsobjectsCustomer(){
		return techconditionsobjectsCustomer;
	}

	public void setTechconditionsobjectsBuilding(String aValue){
		techconditionsobjectsBuilding = aValue;
	}
	public String getTechconditionsobjectsBuilding(){
		return techconditionsobjectsBuilding;
	}

	public void setTechconditionsobjectsAddress(String aValue){
		techconditionsobjectsAddress = aValue;
	}
	public String getTechconditionsobjectsAddress(){
		return techconditionsobjectsAddress;
	}

	public void setTechconditionsobjectsTyCurrentPower(BigDecimal aValue){
		techconditionsobjectsTyCurrentPower = aValue;
	}
	public BigDecimal getTechconditionsobjectsTyCurrentPower(){
		return techconditionsobjectsTyCurrentPower;
	}

	public void setTechconditionsobjectsTyServicesPower(BigDecimal aValue){
		techconditionsobjectsTyServicesPower = aValue;
	}
	public BigDecimal getTechconditionsobjectsTyServicesPower(){
		return techconditionsobjectsTyServicesPower;
	}

	public void setTechconditionsobjectsConnectionPowerPlaces(String aValue){
		techconditionsobjectsConnectionPowerPlaces = aValue;
	}
	public String getTechconditionsobjectsConnectionPowerPlaces(){
		return techconditionsobjectsConnectionPowerPlaces;
	}

	public void setTechconditionsobjectsConnectionPowerPlacesNum(String aValue){
		techconditionsobjectsConnectionPowerPlacesNum = aValue;
	}
	public String getTechconditionsobjectsConnectionPowerPlacesNum(){
		return techconditionsobjectsConnectionPowerPlacesNum;
	}

	public void setTechconditionsobjectsConnectionPowerPoint(String aValue){
		techconditionsobjectsConnectionPowerPoint = aValue;
	}
	public String getTechconditionsobjectsConnectionPowerPoint(){
		return techconditionsobjectsConnectionPowerPoint;
	}

	public void setTechconditionsobjectsConnectionPowerPointNum(String aValue){
		techconditionsobjectsConnectionPowerPointNum = aValue;
	}
	public String getTechconditionsobjectsConnectionPowerPointNum(){
		return techconditionsobjectsConnectionPowerPointNum;
	}

	public void setTechconditionsobjectsConnectionSource(String aValue){
		techconditionsobjectsConnectionSource = aValue;
	}
	public String getTechconditionsobjectsConnectionSource(){
		return techconditionsobjectsConnectionSource;
	}

	public void setTechconditionsobjectsConnectionSourceNum(String aValue){
		techconditionsobjectsConnectionSourceNum = aValue;
	}
	public String getTechconditionsobjectsConnectionSourceNum(){
		return techconditionsobjectsConnectionSourceNum;
	}

	public void setTechconditionsobjectsCat1CurrentPower(BigDecimal aValue){
		techconditionsobjectsCat1CurrentPower = aValue;
	}
	public BigDecimal getTechconditionsobjectsCat1CurrentPower(){
		return techconditionsobjectsCat1CurrentPower;
	}

	public void setTechconditionsobjectsCat2CurrentPower(BigDecimal aValue){
		techconditionsobjectsCat2CurrentPower = aValue;
	}
	public BigDecimal getTechconditionsobjectsCat2CurrentPower(){
		return techconditionsobjectsCat2CurrentPower;
	}

	public void setTechconditionsobjectsCat3CurrentPower(BigDecimal aValue){
		techconditionsobjectsCat3CurrentPower = aValue;
	}
	public BigDecimal getTechconditionsobjectsCat3CurrentPower(){
		return techconditionsobjectsCat3CurrentPower;
	}

	public void setTechconditionsobjectsCat1ServicesPower(BigDecimal aValue){
		techconditionsobjectsCat1ServicesPower = aValue;
	}
	public BigDecimal getTechconditionsobjectsCat1ServicesPower(){
		return techconditionsobjectsCat1ServicesPower;
	}

	public void setTechconditionsobjectsCat2ServicesPower(BigDecimal aValue){
		techconditionsobjectsCat2ServicesPower = aValue;
	}
	public BigDecimal getTechconditionsobjectsCat2ServicesPower(){
		return techconditionsobjectsCat2ServicesPower;
	}

	public void setTechconditionsobjectsCat3ServicesPower(BigDecimal aValue){
		techconditionsobjectsCat3ServicesPower = aValue;
	}
	public BigDecimal getTechconditionsobjectsCat3ServicesPower(){
		return techconditionsobjectsCat3ServicesPower;
	}

	public void setTechconditionsobjectsTyServicesPowerWaterHeating(BigDecimal aValue){
		techconditionsobjectsTyServicesPowerWaterHeating = aValue;
	}
	public BigDecimal getTechconditionsobjectsTyServicesPowerWaterHeating(){
		return techconditionsobjectsTyServicesPowerWaterHeating;
	}

	public void setTechconditionsobjectsTyServicesPowerHeating(BigDecimal aValue){
		techconditionsobjectsTyServicesPowerHeating = aValue;
	}
	public BigDecimal getTechconditionsobjectsTyServicesPowerHeating(){
		return techconditionsobjectsTyServicesPowerHeating;
	}

	public void setTechconditionsobjectsTyServicesPowerCooker(BigDecimal aValue){
		techconditionsobjectsTyServicesPowerCooker = aValue;
	}
	public BigDecimal getTechconditionsobjectsTyServicesPowerCooker(){
		return techconditionsobjectsTyServicesPowerCooker;
	}

	public void setTechconditionsobjectsPowerGeneration(BigDecimal aValue){
		techconditionsobjectsPowerGeneration = aValue;
	}
	public BigDecimal getTechconditionsobjectsPowerGeneration(){
		return techconditionsobjectsPowerGeneration;
	}

	public void setTechconditionsobjectsYearGen(int aValue){
		techconditionsobjectsYearGen = aValue;
	}
	public int getTechconditionsobjectsYearGen(){
		return techconditionsobjectsYearGen;
	}

	public void setTechconditionsobjectsPerformer(String aValue){
		techconditionsobjectsPerformer = aValue;
	}
	public String getTechconditionsobjectsPerformer(){
		return techconditionsobjectsPerformer;
	}

	public void setTechconditionsobjectsPerformerPhone(String aValue){
		techconditionsobjectsPerformerPhone = aValue;
	}
	public String getTechconditionsobjectsPerformerPhone(){
		return techconditionsobjectsPerformerPhone;
	}

	public void setTechconditionsobjectsUserGen(String aValue){
		techconditionsobjectsUserGen = aValue;
	}
	public String getTechconditionsobjectsUserGen(){
		return techconditionsobjectsUserGen;
	}

	public void setTechconditionsobjectsDateEdit(Date aValue){
		techconditionsobjectsDateEdit = aValue;
	}
	public Date getTechconditionsobjectsDateEdit(){
		return techconditionsobjectsDateEdit;
	}

	public void setTcoValuesTypeCode(int aValue){
		tcoValuesTypeCode = aValue;
	}
	public int getTcoValuesTypeCode(){
		return tcoValuesTypeCode;
	}

	public void setTcoValuesTypeName(String aValue){
		tcoValuesTypeName = aValue;
	}
	public String getTcoValuesTypeName(){
		return tcoValuesTypeName;
	}



}

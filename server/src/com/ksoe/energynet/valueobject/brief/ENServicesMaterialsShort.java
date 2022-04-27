
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENServicesMaterials;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENServicesMaterialsShort implements Serializable {

	private static final long serialVersionUID = 1L;

	public int code = Integer.MIN_VALUE;
	public String materialName;
	public String measureUnitName;
	public BigDecimal priceGen;
	public BigDecimal countGen;
	public BigDecimal sumGen;
	public int servicesCostRefCode = Integer.MIN_VALUE;
	public Date servicesCostRefDateGen;
	public BigDecimal servicesCostRefCountGen;
	public BigDecimal servicesCostRefCalculationCost;
	public BigDecimal servicesCostRefCostWithoutVAT;
	public BigDecimal servicesCostRefCostVAT;
	public BigDecimal servicesCostRefCostWithVAT;
	public int calcMaterialsRefCode = Integer.MIN_VALUE;
	public int materialRefCode = Integer.MIN_VALUE;
	public String materialRefName;
	public BigDecimal materialRefCost;
	public int materialRefDeliveryDate = Integer.MIN_VALUE;
	public String materialRefNumkatalog;
	public String materialRefIdentid;
	public int kartaRefCode = Integer.MIN_VALUE;
	public String kartaRefTechKartNumber;
	public String kartaRefName;
	public String kartaRefSafety;
	public Date kartaRefDateCreation;
	public Date kartaRefDateFrom;
	public Date kartaRefDateTo;
	public String kartaRefWorkconditions;


	public void setCode(int aValue){
		code = aValue;
	}

	public int getCode(){
		return code;
	}

	public void setMaterialName(String aValue){
		materialName = aValue;
	}

	public String getMaterialName(){
		return materialName;
	}

	public void setMeasureUnitName(String aValue){
		measureUnitName = aValue;
	}

	public String getMeasureUnitName(){
		return measureUnitName;
	}

	public void setPriceGen(BigDecimal aValue){
		priceGen = aValue;
	}

	public BigDecimal getPriceGen(){
		return priceGen;
	}

	public void setCountGen(BigDecimal aValue){
		countGen = aValue;
	}

	public BigDecimal getCountGen(){
		return countGen;
	}

	public void setSumGen(BigDecimal aValue){
		sumGen = aValue;
	}

	public BigDecimal getSumGen(){
		return sumGen;
	}


	public void setServicesCostRefCode(int aValue){
		servicesCostRefCode = aValue;
	}
	public int getServicesCostRefCode(){
		return servicesCostRefCode;
	}

	public void setServicesCostRefDateGen(Date aValue){
		servicesCostRefDateGen = aValue;
	}
	public Date getServicesCostRefDateGen(){
		return servicesCostRefDateGen;
	}

	public void setServicesCostRefCountGen(BigDecimal aValue){
		servicesCostRefCountGen = aValue;
	}
	public BigDecimal getServicesCostRefCountGen(){
		return servicesCostRefCountGen;
	}

	public void setServicesCostRefCalculationCost(BigDecimal aValue){
		servicesCostRefCalculationCost = aValue;
	}
	public BigDecimal getServicesCostRefCalculationCost(){
		return servicesCostRefCalculationCost;
	}

	public void setServicesCostRefCostWithoutVAT(BigDecimal aValue){
		servicesCostRefCostWithoutVAT = aValue;
	}
	public BigDecimal getServicesCostRefCostWithoutVAT(){
		return servicesCostRefCostWithoutVAT;
	}

	public void setServicesCostRefCostVAT(BigDecimal aValue){
		servicesCostRefCostVAT = aValue;
	}
	public BigDecimal getServicesCostRefCostVAT(){
		return servicesCostRefCostVAT;
	}

	public void setServicesCostRefCostWithVAT(BigDecimal aValue){
		servicesCostRefCostWithVAT = aValue;
	}
	public BigDecimal getServicesCostRefCostWithVAT(){
		return servicesCostRefCostWithVAT;
	}

	public void setCalcMaterialsRefCode(int aValue){
		calcMaterialsRefCode = aValue;
	}
	public int getCalcMaterialsRefCode(){
		return calcMaterialsRefCode;
	}

	public void setMaterialRefCode(int aValue){
		materialRefCode = aValue;
	}
	public int getMaterialRefCode(){
		return materialRefCode;
	}

	public void setMaterialRefName(String aValue){
		materialRefName = aValue;
	}
	public String getMaterialRefName(){
		return materialRefName;
	}

	public void setMaterialRefCost(BigDecimal aValue){
		materialRefCost = aValue;
	}
	public BigDecimal getMaterialRefCost(){
		return materialRefCost;
	}

	public void setMaterialRefDeliveryDate(int aValue){
		materialRefDeliveryDate = aValue;
	}
	public int getMaterialRefDeliveryDate(){
		return materialRefDeliveryDate;
	}

	public void setMaterialRefNumkatalog(String aValue){
		materialRefNumkatalog = aValue;
	}
	public String getMaterialRefNumkatalog(){
		return materialRefNumkatalog;
	}

	public void setMaterialRefIdentid(String aValue){
		materialRefIdentid = aValue;
	}
	public String getMaterialRefIdentid(){
		return materialRefIdentid;
	}

	public void setKartaRefCode(int aValue){
		kartaRefCode = aValue;
	}
	public int getKartaRefCode(){
		return kartaRefCode;
	}

	public void setKartaRefTechKartNumber(String aValue){
		kartaRefTechKartNumber = aValue;
	}
	public String getKartaRefTechKartNumber(){
		return kartaRefTechKartNumber;
	}

	public void setKartaRefName(String aValue){
		kartaRefName = aValue;
	}
	public String getKartaRefName(){
		return kartaRefName;
	}

	public void setKartaRefSafety(String aValue){
		kartaRefSafety = aValue;
	}
	public String getKartaRefSafety(){
		return kartaRefSafety;
	}

	public void setKartaRefDateCreation(Date aValue){
		kartaRefDateCreation = aValue;
	}
	public Date getKartaRefDateCreation(){
		return kartaRefDateCreation;
	}

	public void setKartaRefDateFrom(Date aValue){
		kartaRefDateFrom = aValue;
	}
	public Date getKartaRefDateFrom(){
		return kartaRefDateFrom;
	}

	public void setKartaRefDateTo(Date aValue){
		kartaRefDateTo = aValue;
	}
	public Date getKartaRefDateTo(){
		return kartaRefDateTo;
	}

	public void setKartaRefWorkconditions(String aValue){
		kartaRefWorkconditions = aValue;
	}
	public String getKartaRefWorkconditions(){
		return kartaRefWorkconditions;
	}



}

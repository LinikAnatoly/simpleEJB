
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright ? 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for RegulatoryAssetBaseCalculation;  	
  */

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.io.Serializable;


public class RegulatoryAssetBaseCalculationShort implements Serializable {

	private static final long serialVersionUID = 1L;
	
	/** Период приходования актива */
	public transient LocalDate assetIncomeDatePeriod = null;
	/** Дата начала квартала в котором оприходовался актив */
	public transient LocalDate assetIncomeDateQuarterStart = null;
	/** Дата начала эксплуатации */
	public transient LocalDate beginOfUse = null;
	/** Значение периода типа java.time.LocalDate */
	public transient LocalDate localPeriod = null;
	/** Начало квартала для заданого периода*/
	public transient LocalDate periodQuarterStart = null;
	/** Период ликвидации актива */
	public transient LocalDate assetWriteOffPeriod = null;
	
	/** Частичные списания стоимости актива сгруппированные по периодам*/ 
	public transient Map<LocalDate, List<RegulatoryAssetBasePartialWriteOffShort>> writeOffs = null;
	/** Периоды консервации актива */
	public transient Collection<LocalDate> outOfUsePeriods = null;
	
	/** Суммарное значение списанной стоимости за заданный период */
	public transient BigDecimal writtenOffValueInPeriod;
	
	public int code = Integer.MIN_VALUE;
	public Date period;
	public BigDecimal originalValue;
	public BigDecimal depreciation;
	public BigDecimal residualValue;
	public BigDecimal writtenOffValue;
	public int assetRefCode = Integer.MIN_VALUE;
	public int usefulLife = Integer.MIN_VALUE;
	public String assetRefInventoryNumber;
	public String assetRefName;
	public Date assetRefIncomeDate;
	public String assetRefDocumentNumber;
	public BigDecimal assetRefOriginalValue;
	public Boolean assetRefInitial;
	public int assetRefGroupRefCode = Integer.MIN_VALUE;
	public String assetRefGroupRefNumber = null;
	public String assetRefGroupRefName = null;
	public int assetRefUsefulLife = Integer.MIN_VALUE;
	public String assetRefWriteOffNumber;
	public Date assetRefWriteOffDate;
	
	public Boolean assetRefInvestition;
	public String assetRefInvestitionProgramName;
	public int assetRefInvestitionProgramYear = Integer.MIN_VALUE;
	public String assetRefInvestitionProgramCipher;
	public Boolean assetRefConnection ;
	public String assetRefConnectionNumber;
	public Date assetRefConnectionDate ;
	public String assetRefConnectionContragent;
	public int assetRefCategoryCode = Integer.MIN_VALUE;
	public int assetRefParentRefCode = Integer.MIN_VALUE;
	public int assetRefFundingSourceRefCode = Integer.MIN_VALUE;
	public String assetRefFundingSourceRefName;	
	
	
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public Date getPeriod() {
		return period;
	}

	public void setPeriod(Date period) {
		this.period = period;
	}

	public BigDecimal getOriginalValue() {
		return originalValue;
	}

	public void setOriginalValue(BigDecimal originalValue) {
		this.originalValue = originalValue;
	}

	public BigDecimal getDepreciation() {
		return depreciation;
	}

	public void setDepreciation(BigDecimal depreciation) {
		this.depreciation = depreciation;
	}

	public BigDecimal getResidualValue() {
		return residualValue;
	}

	public void setResidualValue(BigDecimal residualValue) {
		this.residualValue = residualValue;
	}


	public int getAssetRefCode(){
		return assetRefCode;
	}

	public void setAssetRefCode(int assetRefCode) {
		this.assetRefCode = assetRefCode;
	}

	public String getAssetRefInventoryNumber(){
		return assetRefInventoryNumber;
	}

	public void setAssetRefInventoryNumber(String assetRefInventoryNumber) {
		this.assetRefInventoryNumber = assetRefInventoryNumber;
	}

	public String getAssetRefName(){
		return assetRefName;
	}

	public void setAssetRefName(String assetRefName) {
		this.assetRefName = assetRefName;
	}

	public Date getAssetRefIncomeDate(){
		return assetRefIncomeDate;
	}

	public void setAssetRefIncomeDate(Date assetRefIncomeDate) {
		this.assetRefIncomeDate = assetRefIncomeDate;
	}

	public String getAssetRefDocumentNumber() {
		return assetRefDocumentNumber;
	}

	public void setAssetRefDocumentNumber(String assetRefDocumentNumber) {
		this.assetRefDocumentNumber = assetRefDocumentNumber;
	}

	public BigDecimal getAssetRefOriginalValue(){
		return assetRefOriginalValue;
	}

	public void setAssetRefOriginalValue(BigDecimal assetRefOriginalValue) {
		this.assetRefOriginalValue = assetRefOriginalValue;
	}

	public Boolean getAssetRefInitial(){
		return assetRefInitial;
	}

	public void setAssetRefInitial(Boolean assetRefInitial) {
		this.assetRefInitial = assetRefInitial;
	}

	public int getAssetRefGroupRefCode() {
		return assetRefGroupRefCode;
	}

	public void setAssetRefGroupRefCode(int value) {
		this.assetRefGroupRefCode = value;
	}

	public String getAssetRefGroupRefNumber() {
		return assetRefGroupRefNumber;
	}

	public void setAssetRefGroupRefNumber(String value) {
		this.assetRefGroupRefNumber = value;
	}

	public String getAssetRefGroupRefName() {
		return assetRefGroupRefName;
	}

	public void setAssetRefGroupRefName(String value) {
		this.assetRefGroupRefName = value;
	}

	public int getAssetRefUsefulLife() {
		return assetRefUsefulLife;
	}

	public void setAssetRefUsefulLife(int assetRefUsefulLife) {
		this.assetRefUsefulLife = assetRefUsefulLife;
	}
	
	public int getUsefulLife() {
		return usefulLife;
	}

	public void setUsefulLife(int usefulLife) {
		this.usefulLife = usefulLife;
	}

	public Date getAssetRefWriteOffDate() {
		return assetRefWriteOffDate;
	}

	public void setAssetRefWriteOffDate(Date assetWriteOffDate) {
		this.assetRefWriteOffDate = assetWriteOffDate;
	}

	public BigDecimal getWrittenOffValue() {
		return writtenOffValue;
	}

	public void setWrittenOffValue(BigDecimal value) {
		this.writtenOffValue = value;
	}

	public String getAssetRefWriteOffNumber() {
		return assetRefWriteOffNumber;
	}

	public void setAssetRefWriteOffNumber(String value) {
		this.assetRefWriteOffNumber = value;
	}

	public Boolean getAssetRefInvestition() {
		return assetRefInvestition;
	}

	public void setAssetRefInvestition(Boolean assetRefInvestition) {
		this.assetRefInvestition = assetRefInvestition;
	}

	public String getAssetRefInvestitionProgramName() {
		return assetRefInvestitionProgramName;
	}

	public void setAssetRefInvestitionProgramName(String assetRefInvestitionProgramName) {
		this.assetRefInvestitionProgramName = assetRefInvestitionProgramName;
	}

	public int getAssetRefInvestitionProgramYear() {
		return assetRefInvestitionProgramYear;
	}

	public void setAssetRefInvestitionProgramYear(int assetRefInvestitionProgramYear) {
		this.assetRefInvestitionProgramYear = assetRefInvestitionProgramYear;
	}

	public String getAssetRefInvestitionProgramCipher() {
		return assetRefInvestitionProgramCipher;
	}

	public void setAssetRefInvestitionProgramCipher(String assetRefInvestitionProgramCipher) {
		this.assetRefInvestitionProgramCipher = assetRefInvestitionProgramCipher;
	}

	public Boolean getAssetRefConnection() {
		return assetRefConnection;
	}

	public void setAssetRefConnection(Boolean assetRefConnection) {
		this.assetRefConnection = assetRefConnection;
	}

	public String getAssetRefConnectionNumber() {
		return assetRefConnectionNumber;
	}

	public void setAssetRefConnectionNumber(String assetRefConnectionNumber) {
		this.assetRefConnectionNumber = assetRefConnectionNumber;
	}

	public Date getAssetRefConnectionDate() {
		return assetRefConnectionDate;
	}

	public void setAssetRefConnectionDate(Date assetRefConnectionDate) {
		this.assetRefConnectionDate = assetRefConnectionDate;
	}

	public String getAssetRefConnectionContragent() {
		return assetRefConnectionContragent;
	}

	public void setAssetRefConnectionContragent(String assetRefConnectionContragent) {
		this.assetRefConnectionContragent = assetRefConnectionContragent;
	}

	public int getAssetRefCategoryCode() {
		return assetRefCategoryCode;
	}

	public void setAssetRefCategoryCode(int assetRefCategoryCode) {
		this.assetRefCategoryCode = assetRefCategoryCode;
	}

	public int getAssetRefParentRefCode() {
		return assetRefParentRefCode;
	}

	public void setAssetRefParentRefCode(int assetRefParentRefCode) {
		this.assetRefParentRefCode = assetRefParentRefCode;
	}

	public int getAssetRefFundingSourceRefCode() {
		return assetRefFundingSourceRefCode;
	}

	public void setAssetRefFundingSourceRefCode(int assetRefFundingSourceRefCode) {
		this.assetRefFundingSourceRefCode = assetRefFundingSourceRefCode;
	}

	public String getAssetRefFundingSourceRefName() {
		return assetRefFundingSourceRefName;
	}

	public void setAssetRefFundingSourceRefName(String value) {
		this.assetRefFundingSourceRefName = value;
	}
}
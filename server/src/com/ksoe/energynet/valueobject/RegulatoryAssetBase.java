
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  import java.io.Serializable;

/**
  * Value Object for RegulatoryAssetBase;  	
  */

import java.math.BigDecimal;
import java.util.Comparator;
import java.util.Date;
import java.util.Objects;

import com.ksoe.energynet.valueobject.references.RegulatoryAssetBaseFundingSourceRef;
import  com.ksoe.energynet.valueobject.references.RegulatoryAssetBaseGroupRef;
import com.ksoe.energynet.valueobject.references.RegulatoryAssetBaseRef;

public class RegulatoryAssetBase implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE;
    public String  inventoryNumber;
    public int  inventoryCode = Integer.MIN_VALUE;
    public String  name; 
    public Date incomeDate;
    public String  documentNumber;
    public BigDecimal  originalValue; 
    public int  usefulLife = Integer.MIN_VALUE;
    public Boolean  initial = null;
    public String writeOffNumber;
    public Date writeOffDate;
    public Boolean  investition = null;
    public String  investitionProgramName; 
    public int  investitionProgramYear = Integer.MIN_VALUE;
    public String  investitionProgramCipher; 
    public Boolean  connection = null;
    public String  connectionNumber; 
    public Date connectionDate;
    public String  connectionContragent; 
    public int  categoryCode = Integer.MIN_VALUE;
    public RegulatoryAssetBaseRef parentRef = new RegulatoryAssetBaseRef();
    public RegulatoryAssetBaseGroupRef groupRef = new RegulatoryAssetBaseGroupRef();
    public RegulatoryAssetBaseFundingSourceRef fundingSourceRef = new RegulatoryAssetBaseFundingSourceRef();
    
    public static final String tableName = "REGULATORYASSETBASE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "REGULATORYASSETBASE.CODE";
    public static final String inventoryNumber_Attr = "inventoryNumber";
    public static final String inventoryNumber_Field = "INVENTORYNUMBER";
    public static final String inventoryNumber_QFielld = "REGULATORYASSETBASE.INVENTORYNUMBER";
    public static final String inventoryCode_Attr = "inventoryCode";
    public static final String inventoryCode_Field = "INVENTORYCODE";
    public static final String inventoryCode_QFielld = "REGULATORYASSETBASE.INVENTORYCODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "REGULATORYASSETBASE.NAME";
    public static final String incomeDate_Attr = "incomeDate";
    public static final String incomeDate_Field = "INCOMEDATE";
    public static final String incomeDate_QFielld = "REGULATORYASSETBASE.INCOMEDATE";
    public static final String documentNumber_Attr = "documentNumber";
    public static final String documentNumber_Field = "DOCUMENTNUMBER";
    public static final String documentNumber_QFielld = "REGULATORYASSETBASE.DOCUMENTNUMBER";
    public static final String originalValue_Attr = "originalValue";
    public static final String originalValue_Field = "ORIGINALVALUE";
    public static final String originalValue_QFielld = "REGULATORYASSETBASE.ORIGINALVALUE";
    public static final String usefulLife_Attr = "usefulLife";
    public static final String usefulLife_Field = "USEFULLIFE";
    public static final String usefulLife_QFielld = "REGULATORYASSETBASE.USEFULLIFE";
    public static final String initial_Attr = "initial";
    public static final String initial_Field = "INITIAL";
    public static final String initial_QFielld = "REGULATORYASSETBASE.INITIAL";
    public static final String writeOffNumber_Attr = "writeOffNumber";
    public static final String writeOffNumber_Field = "WRITEOFFNUMBER";
    public static final String writeOffNumber_QFielld = "REGULATORYASSETBASE.WRITEOFFNUMBER";
    public static final String writeOffDate_Attr = "writeOffDate";
    public static final String writeOffDate_Field = "WRITEOFFDATE";
    public static final String writeOffDate_QFielld = "REGULATORYASSETBASE.WRITEOFFDATE";

    public static final String groupRef_Attr = "groupRef";
    public static final String groupRef_Field = "GROUPREFCODE";
    public static final String  groupRef_QFielld = "REGULATORYASSETBASE.GROUPREFCODE";
    
    public static final String investition_Attr = "investition";
    public static final String investition_Field = "INVESTITION";
    public static final String investition_QFielld = "REGULATORYASSETBASE.INVESTITION";
    public static final String investitionProgramName_Attr = "investitionProgramName";
    public static final String investitionProgramName_Field = "INVESTITIONPROGRAMNAME";
    public static final String investitionProgramName_QFielld = "REGULATORYASSETBASE.INVESTITIONPROGRAMNAME";
    public static final String investitionProgramYear_Attr = "investitionProgramYear";
    public static final String investitionProgramYear_Field = "INVESTITIONPROGRAMYEAR";
    public static final String investitionProgramYear_QFielld = "REGULATORYASSETBASE.INVESTITIONPROGRAMYEAR";
    public static final String investitionProgramCipher_Attr = "investitionProgramCipher";
    public static final String investitionProgramCipher_Field = "INVESTITIONPROGRAMCIPHER";
    public static final String investitionProgramCipher_QFielld = "REGULATORYASSETBASE.INVESTITIONPROGRAMCPHR";
    public static final String connection_Attr = "connection";
    public static final String connection_Field = "CONNECTION";
    public static final String connection_QFielld = "REGULATORYASSETBASE.CONNECTION";
    public static final String connectionNumber_Attr = "connectionNumber";
    public static final String connectionNumber_Field = "CONNECTIONNUMBER";
    public static final String connectionNumber_QFielld = "REGULATORYASSETBASE.CONNECTIONNUMBER";
    public static final String connectionDate_Attr = "connectionDate";
    public static final String connectionDate_Field = "CONNECTIONDATE";
    public static final String connectionDate_QFielld = "REGULATORYASSETBASE.CONNECTIONDATE";
    public static final String connectionContragent_Attr = "connectionContragent";
    public static final String connectionContragent_Field = "CONNECTIONCONTRAGENT";
    public static final String connectionContragent_QFielld = "REGULATORYASSETBASE.CONNECTIONCONTRAGENT";
    public static final String categoryCode_Attr = "categoryCode";
    public static final String categoryCode_Field = "CATEGORYCODE";
    public static final String categoryCode_QFielld = "REGULATORYASSETBASE.CATEGORYCODE";
    public static final String parentRef_Attr = "parentRef";
    public static final String parentRef_Field = "PARENTREFCODE";
    public static final String  parentRef_QFielld = "REGULATORYASSETBASE.PARENTREFCODE";
    public static final String fundingSourceRef_Attr = "fundingSourceRef";
    public static final String fundingSourceRef_Field = "FUNDINGSOURCEREFCODE";
    public static final String  fundingSourceRef_QFielld = "REGULATORYASSETBASE.FUNDINGSOURCEREFCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public String getInventoryNumber(){
       return inventoryNumber;
    }
    
    public void setInventoryNumber(String inventoryNumber){
       this.inventoryNumber = inventoryNumber;
    }


    public int getInventoryCode() {
		return inventoryCode;
	}

	public void setInventoryCode(int inventoryCode) {
		this.inventoryCode = inventoryCode;
	}

	public String getName(){
       return name;
    }
    
    public void setName(String name){
       this.name = name;
    }


    public Date getIncomeDate(){
       return incomeDate;
    }

    public String getDocumentNumber(){
       return documentNumber;
    }
     
    public void setDocumentNumber(String documentNumber){
       this.documentNumber = documentNumber;
    }
     
    public void setIncomeDate(Date incomeDate){
       this.incomeDate = incomeDate;
    }


    public BigDecimal getOriginalValue(){
       return originalValue;
    }
    
    public void setOriginalValue(BigDecimal originalValue){
       this.originalValue = originalValue;
    }


    public int getUsefulLife(){
       return usefulLife;
    }
    
    public void setUsefulLife(int usefulLife){
       this.usefulLife = usefulLife;
    }


    public Boolean getInitial(){
       return initial;
    }

    public void setInitial(Boolean initial){
       this.initial = initial;
    }


    public Date getWriteOffDate(){
       return writeOffDate;
    }

    public void setWriteOffDate(Date writeOffDate){
       this.writeOffDate = writeOffDate;
    }

    public Boolean getInvestition() {
		return investition;
	}

	public String getInvestitionProgramName() {
		return investitionProgramName;
	}

	public int getInvestitionProgramYear() {
		return investitionProgramYear;
	}

	public String getInvestitionProgramCipher() {
		return investitionProgramCipher;
	}

	public Boolean getConnection() {
		return connection;
	}

	public String getConnectionNumber() {
		return connectionNumber;
	}

	public Date getConnectionDate() {
		return connectionDate;
	}

	public String getConnectionContragent() {
		return connectionContragent;
	}

	public int getCategoryCode() {
		return categoryCode;
	}

	public RegulatoryAssetBaseRef getParentRef() {
		return parentRef;
	}

	public RegulatoryAssetBaseFundingSourceRef getFundingSourceRef() {
		return fundingSourceRef;
	}

	public void setInvestition(Boolean investition) {
		this.investition = investition;
	}

	public void setInvestitionProgramName(String investitionProgramName) {
		this.investitionProgramName = investitionProgramName;
	}

	public void setInvestitionProgramYear(int investitionProgramYear) {
		this.investitionProgramYear = investitionProgramYear;
	}

	public void setInvestitionProgramCipher(String investitionProgramCipher) {
		this.investitionProgramCipher = investitionProgramCipher;
	}

	public void setConnection(Boolean connection) {
		this.connection = connection;
	}

	public void setConnectionNumber(String connectionNumber) {
		this.connectionNumber = connectionNumber;
	}

	public void setConnectionDate(Date connectionDate) {
		this.connectionDate = connectionDate;
	}

	public void setConnectionContragent(String connectionContragent) {
		this.connectionContragent = connectionContragent;
	}

	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}

	public void setParentRef(RegulatoryAssetBaseRef parentRef) {
		this.parentRef = parentRef;
	}

	public void setFundingSourceRef(RegulatoryAssetBaseFundingSourceRef fundingSourceRef) {
		this.fundingSourceRef = fundingSourceRef;
	}

	public RegulatoryAssetBaseGroupRef getGroupRef(){
       return groupRef;
    }
    
    public void setGroupRef(RegulatoryAssetBaseGroupRef groupRef){
       this.groupRef = groupRef;
    }
    
    public String getWriteOffNumber() {
		return writeOffNumber;
	}

	public void setWriteOffNumber(String value) {
		this.writeOffNumber = value;
	}

	@Override
    public boolean equals(Object object) {
		if(object == null || object.getClass() != this.getClass()) return false;
		if(this == object) return true;
		RegulatoryAssetBase another = (RegulatoryAssetBase)object;
		
		return Objects.equals(this.code, another.code)
			&& Objects.equals(this.inventoryNumber, another.inventoryNumber)
			&& Objects.equals(this.inventoryCode, another.inventoryCode)
			&& Objects.equals(this.name, another.name)
			&& Objects.compare(this.incomeDate, another.incomeDate, Comparator.nullsFirst(Date::compareTo)) == 0
			&& Objects.equals(this.documentNumber, another.documentNumber)
			&& Objects.compare(this.originalValue, another.originalValue, Comparator.nullsFirst(BigDecimal::compareTo)) == 0
			&& Objects.equals(this.usefulLife, another.usefulLife)
			&& Objects.compare(this.initial, another.initial, Comparator.nullsFirst(Boolean::compareTo)) == 0
			&& Objects.equals(this.writeOffNumber, another.writeOffNumber)
			&& Objects.compare(this.writeOffDate, another.writeOffDate, Comparator.nullsFirst(Date::compareTo)) == 0
			&& Objects.compare(this.investition, another.investition, Comparator.nullsFirst(Boolean::compareTo)) == 0
			&& Objects.equals(this.investitionProgramName, another.investitionProgramName)
			&& Objects.equals(this.investitionProgramYear, another.investitionProgramYear)
			&& Objects.equals(this.investitionProgramCipher, another.investitionProgramCipher)
			&& Objects.compare(this.connection, another.connection, Comparator.nullsFirst(Boolean::compareTo)) == 0
			&& Objects.equals(this.connectionNumber, another.connectionNumber)
			&& Objects.compare(this.connectionDate, another.connectionDate, Comparator.nullsFirst(Date::compareTo)) == 0
			&& Objects.equals(this.connectionContragent, another.connectionContragent)
			&& Objects.equals(this.categoryCode, another.categoryCode)
			&& Objects.equals(this.parentRef, another.parentRef)
			&& Objects.equals(this.groupRef, another.groupRef)
			&& Objects.equals(this.fundingSourceRef, another.fundingSourceRef);
	}
    
    public boolean checkIfRecalculationIsNeeded(RegulatoryAssetBase another) {
    	return !(Objects.compare(this.incomeDate, another.incomeDate, Comparator.nullsFirst(Date::compareTo)) == 0
    			&& Objects.compare(this.originalValue, another.originalValue, Comparator.nullsFirst(BigDecimal::compareTo)) == 0
    			&& Objects.equals(this.usefulLife, another.usefulLife)
    			&& Objects.compare(this.initial, another.initial, Comparator.nullsFirst(Boolean::compareTo)) == 0
    			&& Objects.compare(this.writeOffDate, another.writeOffDate, Comparator.nullsFirst(Date::compareTo)) == 0);
    }

} // end of RegulatoryAssetBaseValueObject


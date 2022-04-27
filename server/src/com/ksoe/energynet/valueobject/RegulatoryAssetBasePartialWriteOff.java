
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for RegulatoryAssetBasePartialWriteOff;  	
  */

import java.math.BigDecimal;
import java.util.Comparator;
import java.util.Date;
import java.util.Objects;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.RegulatoryAssetBaseRef;

public class RegulatoryAssetBasePartialWriteOff implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE;
	public String writeOffNumber;
    public Date writeOffDate;
    public BigDecimal  value; 
    public BigDecimal  percentage; 

    public RegulatoryAssetBaseRef assetRef = new RegulatoryAssetBaseRef();

    public static final String tableName = "REGULATRSSTBSPRTLWRTFF";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "REGULATRSSTBSPRTLWRTFF.CODE";
    public static final String writeOffNumber_Attr = "writeOffNumber";
    public static final String writeOffNumber_Field = "WRITEOFFNUMBER";
    public static final String writeOffNumber_QFielld = "REGULATRSSTBSPRTLWRTFF.WRITEOFFNUMBER";
    public static final String writeOffDate_Attr = "writeOffDate";
    public static final String writeOffDate_Field = "WRITEOFFDATE";
    public static final String writeOffDate_QFielld = "REGULATRSSTBSPRTLWRTFF.WRITEOFFDATE";
    public static final String value_Attr = "value";
    public static final String value_Field = "VALUE";
    public static final String value_QFielld = "REGULATRSSTBSPRTLWRTFF.VALUE";
    public static final String percentage_Attr = "percentage";
    public static final String percentage_Field = "PERCENTAGE";
    public static final String percentage_QFielld = "REGULATRSSTBSPRTLWRTFF.PERCENTAGE";

    public static final String assetRef_Attr = "assetRef";
    public static final String assetRef_Field = "ASSETREFCODE";
    public static final String  assetRef_QFielld = "REGULATRSSTBSPRTLWRTFF.ASSETREFCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }
    
    public String getWriteOffNumber() {
		return writeOffNumber;
	}

	public void setWriteOffNumber(String writeOffNumber) {
		this.writeOffNumber = writeOffNumber;
	}



    public Date getWriteOffDate(){
       return writeOffDate;
    }

    public void setWriteOffDate(Date writeOffDate){
       this.writeOffDate = writeOffDate;
    }


    public BigDecimal getValue(){
       return value;
    }
    
    public void setValue(BigDecimal value){
       this.value = value;
    }


    public BigDecimal getPercentage(){
       return percentage;
    }
    
    public void setPercentage(BigDecimal percentage){
       this.percentage = percentage;
    }

    public RegulatoryAssetBaseRef getAssetRef(){
       return assetRef;
    }
    
    public void setAssetRef(RegulatoryAssetBaseRef assetRef){
       this.assetRef = assetRef;
    }
    
    @Override
    public boolean equals(Object object) {
		if(object == null || object.getClass() != this.getClass()) return false;
		if(this == object) return true;
		RegulatoryAssetBasePartialWriteOff another = (RegulatoryAssetBasePartialWriteOff)object;
		
		return Objects.equals(this.code, another.code)
				&& Objects.compare(this.value, another.value, Comparator.nullsFirst(BigDecimal::compareTo)) == 0
				&& Objects.equals(this.writeOffNumber, another.writeOffNumber)
				&& Objects.compare(this.writeOffDate, another.writeOffDate, Comparator.nullsFirst(Date::compareTo)) == 0;
	}
    
    public boolean checkIfRecalculationIsNeeded(RegulatoryAssetBasePartialWriteOff another) {
    	return !(Objects.compare(this.value, another.value, Comparator.nullsFirst(BigDecimal::compareTo)) == 0
				&& Objects.compare(this.writeOffDate, another.writeOffDate, Comparator.nullsFirst(Date::compareTo)) == 0);
    }

} // end of RegulatoryAssetBasePartialWriteOffValueObject


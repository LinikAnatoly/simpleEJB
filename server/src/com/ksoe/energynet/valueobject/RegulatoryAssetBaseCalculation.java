
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for RegulatoryAssetBaseCalculation;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.RegulatoryAssetBaseRef;

public class RegulatoryAssetBaseCalculation implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE;
    public Date period;
    public BigDecimal  originalValue; 
    public BigDecimal  depreciation; 
    public BigDecimal  residualValue; 
    public BigDecimal  writtenOffValue;
    public int  usefulLife = Integer.MIN_VALUE;

    public RegulatoryAssetBaseRef assetRef = new RegulatoryAssetBaseRef();

    public static final String tableName = "REGULATORYASSTBSCLCLTN";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "REGULATORYASSTBSCLCLTN.CODE";
    public static final String period_Attr = "period";
    public static final String period_Field = "PERIOD";
    public static final String period_QFielld = "REGULATORYASSTBSCLCLTN.PERIOD";
    public static final String originalValue_Attr = "originalValue";
    public static final String originalValue_Field = "ORIGINALVALUE";
    public static final String originalValue_QFielld = "REGULATORYASSTBSCLCLTN.ORIGINALVALUE";
    public static final String writtenOffValue_Attr = "writtenOffValue";
    public static final String writtenOffValue_Field = "WRITTENOFFVALUE";
    public static final String writtenOffValue_QFielld = "REGULATORYASSTBSCLCLTN.WRITTENOFFVALUE";
    public static final String depreciation_Attr = "depreciation";
    public static final String depreciation_Field = "DEPRECIATION";
    public static final String depreciation_QFielld = "REGULATORYASSTBSCLCLTN.DEPRECIATION";
    public static final String residualValue_Attr = "residualValue";
    public static final String residualValue_Field = "RESIDUALVALUE";
    public static final String residualValue_QFielld = "REGULATORYASSTBSCLCLTN.RESIDUALVALUE";
    public static final String usefulLife_Attr = "usefulLife";
    public static final String usefulLife_Field = "USEFULLIFE";
    public static final String usefulLife_QFielld = "REGULATORYASSTBSCLCLTN.USEFULLIFE";

    public static final String assetRef_Attr = "assetRef";
    public static final String assetRef_Field = "ASSETREFCODE";
    public static final String  assetRef_QFielld = "REGULATORYASSTBSCLCLTN.ASSETREFCODE";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public Date getPeriod(){
       return period;
    }

    public void setPeriod(Date period){
       this.period = period;
    }


    public BigDecimal getOriginalValue(){
       return originalValue;
    }
    
    public void setOriginalValue(BigDecimal originalValue){
       this.originalValue = originalValue;
    }


    public BigDecimal getDepreciation(){
       return depreciation;
    }
    
    public void setDepreciation(BigDecimal depreciation){
       this.depreciation = depreciation;
    }


    public BigDecimal getResidualValue(){
       return residualValue;
    }
    
    public void setResidualValue(BigDecimal residualValue){
       this.residualValue = residualValue;
    }


    public BigDecimal getWrittenOffValue() {
		return writtenOffValue;
	}

	public void setWrittenOffValue(BigDecimal value) {
		this.writtenOffValue = value;
	}

	public int getUsefulLife(){
       return usefulLife;
    }
    
    public void setUsefulLife(int usefulLife){
       this.usefulLife = usefulLife;
    }

    public RegulatoryAssetBaseRef getAssetRef(){
       return assetRef;
    }
    
    public void setAssetRef(RegulatoryAssetBaseRef assetRef){
       this.assetRef = assetRef;
    }

} // end of RegulatoryAssetBaseCalculationValueObject


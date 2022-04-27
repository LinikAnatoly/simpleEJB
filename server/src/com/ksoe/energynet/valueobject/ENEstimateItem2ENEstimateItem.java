
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENEstimateItem2ENEstimateItemENEstimateItem2ENEstimateItem;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.references.ENEstimateItem2TypeRef;
import com.ksoe.energynet.valueobject.references.ENEstimateItemRef;

public class ENEstimateItem2ENEstimateItem implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  countGen; 
    public long  modify_time = Long.MIN_VALUE;
    public ENEstimateItemRef estimateItemInRef = new ENEstimateItemRef();
    public ENEstimateItemRef estimateItemOutRef = new ENEstimateItemRef();
    public ENEstimateItem2TypeRef typeRef = new ENEstimateItem2TypeRef();
    public static final String tableName = "ENESTIMATEITEM2NSTMTTM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENESTIMATEITEM2NSTMTTM.CODE";
    public static final String countGen_Attr = "countGen";
    public static final String countGen_Field = "COUNTGEN";
    public static final String countGen_QFielld = "ENESTIMATEITEM2NSTMTTM.COUNTGEN";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENESTIMATEITEM2NSTMTTM.MODIFY_TIME";
    public static final String estimateItemInRef_Attr = "estimateItemInRef";
    public static final String estimateItemInRef_Field = "ESTIMATEITEMINREFCODE";
    public static final String  estimateItemInRef_QFielld = "ENESTIMATEITEM2NSTMTTM.ESTIMATEITEMINREFCODE";
    public static final String estimateItemOutRef_Attr = "estimateItemOutRef";
    public static final String estimateItemOutRef_Field = "ESTIMATEITEMOUTREFCODE";
    public static final String  estimateItemOutRef_QFielld = "ENESTIMATEITEM2NSTMTTM.ESTIMATEITEMOUTREFCODE";
    public static final String typeRef_Attr = "typeRef";
    public static final String typeRef_Field = "TYPEREFCODE";
    public static final String  typeRef_QFielld = "ENESTIMATEITEM2NSTMTTM.TYPEREFCODE";


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

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

;
    public void setEstimateItemInRef(ENEstimateItemRef aValue){
       estimateItemInRef = aValue;
    }

    public ENEstimateItemRef getEstimateItemInRef(){
       return estimateItemInRef;
    }
    public void setEstimateItemOutRef(ENEstimateItemRef aValue){
       estimateItemOutRef = aValue;
    }

    public ENEstimateItemRef getEstimateItemOutRef(){
       return estimateItemOutRef;
    }
    public void setTypeRef(ENEstimateItem2TypeRef aValue){
       typeRef = aValue;
    }

    public ENEstimateItem2TypeRef getTypeRef(){
       return typeRef;
    }

} // end of ENEstimateItem2ENEstimateItemValueObject


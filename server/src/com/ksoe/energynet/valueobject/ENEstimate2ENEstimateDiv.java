
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENEstimate2ENEstimateDiv;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENEstimateItemRef;
    import  com.ksoe.energynet.valueobject.references.ENEstimateItemRef;

public class ENEstimate2ENEstimateDiv implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  countGen; 
    public long  modify_time = Long.MIN_VALUE;
    public ENEstimateItemRef estimateItemInRef = new ENEstimateItemRef();
    public ENEstimateItemRef estimateItemOutRef = new ENEstimateItemRef();
    public static final String tableName = "ENESTIMATE2ENESTIMATDV";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENESTIMATE2ENESTIMATDV.CODE";
    public static final String countGen_Attr = "countGen";
    public static final String countGen_Field = "COUNTGEN";
    public static final String countGen_QFielld = "ENESTIMATE2ENESTIMATDV.COUNTGEN";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENESTIMATE2ENESTIMATDV.MODIFY_TIME";
    public static final String estimateItemInRef_Attr = "estimateItemInRef";
    public static final String estimateItemInRef_Field = "ESTIMATEITEMINREFCODE";
    public static final String  estimateItemInRef_QFielld = "ENESTIMATE2ENESTIMATDV.ESTIMATEITEMINREFCODE";
    public static final String estimateItemOutRef_Attr = "estimateItemOutRef";
    public static final String estimateItemOutRef_Field = "ESTIMATEITEMOUTREFCODE";
    public static final String  estimateItemOutRef_QFielld = "ENESTIMATE2ENESTIMATDV.ESTIMATEITEMOUTREFCODE";


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

} // end of ENEstimate2ENEstimateDivValueObject


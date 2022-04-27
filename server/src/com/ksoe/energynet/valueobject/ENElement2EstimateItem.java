
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENElement2EstimateItem;  	
  */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.ENElementRef;
import com.ksoe.energynet.valueobject.references.ENElementTypeRef;
import com.ksoe.energynet.valueobject.references.ENEstimateItemRef;

public class ENElement2EstimateItem implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public long  modify_time = Long.MIN_VALUE;
    public ENElementRef elementRef = new ENElementRef();
    public ENElementTypeRef elementTypeRef = new ENElementTypeRef();
    public ENEstimateItemRef estimateItemRef = new ENEstimateItemRef();
    public static final String tableName = "ENELEMENT2ESTIMATEITEM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENELEMENT2ESTIMATEITEM.CODE";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENELEMENT2ESTIMATEITEM.MODIFY_TIME";
    public static final String elementRef_Attr = "elementRef";
    public static final String elementRef_Field = "ELEMENTREFCODE";
    public static final String  elementRef_QFielld = "ENELEMENT2ESTIMATEITEM.ELEMENTREFCODE";
    public static final String elementTypeRef_Attr = "elementTypeRef";
    public static final String elementTypeRef_Field = "ELEMENTTYPEREFCODE";
    public static final String  elementTypeRef_QFielld = "ENELEMENT2ESTIMATEITEM.ELEMENTTYPEREFCODE";
    public static final String estimateItemRef_Attr = "estimateItemRef";
    public static final String estimateItemRef_Field = "ESTIMATEITEMREFCODE";
    public static final String  estimateItemRef_QFielld = "ENELEMENT2ESTIMATEITEM.ESTIMATEITEMREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setElementRef(ENElementRef aValue){
       elementRef = aValue;
    }

    public ENElementRef getElementRef(){
       return elementRef;
    }
    public void setElementTypeRef(ENElementTypeRef aValue){
       elementTypeRef = aValue;
    }

    public ENElementTypeRef getElementTypeRef(){
       return elementTypeRef;
    }
    public void setEstimateItemRef(ENEstimateItemRef aValue){
       estimateItemRef = aValue;
    }

    public ENEstimateItemRef getEstimateItemRef(){
       return estimateItemRef;
    }

} // end of ENElement2EstimateItemValueObject


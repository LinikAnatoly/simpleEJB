
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPWI2Element;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENPlanWorkItemRef;
    import  com.ksoe.energynet.valueobject.references.ENElementRef;

public class ENPWI2Element implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  countGen; 
    public ENPlanWorkItemRef planWorkItemRef = new ENPlanWorkItemRef();
    public ENElementRef elementRef = new ENElementRef();
    public static final String tableName = "ENPWI2ELEMENT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPWI2ELEMENT.CODE";
    public static final String countGen_Attr = "countGen";
    public static final String countGen_Field = "COUNTGEN";
    public static final String countGen_QFielld = "ENPWI2ELEMENT.COUNTGEN";
    public static final String planWorkItemRef_Attr = "planWorkItemRef";
    public static final String planWorkItemRef_Field = "PLANWORKITEMREFCODE";
    public static final String  planWorkItemRef_QFielld = "ENPWI2ELEMENT.PLANWORKITEMREFCODE";
    public static final String elementRef_Attr = "elementRef";
    public static final String elementRef_Field = "ELEMENTREFCODE";
    public static final String  elementRef_QFielld = "ENPWI2ELEMENT.ELEMENTREFCODE";



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

    public void setPlanWorkItemRef(ENPlanWorkItemRef aValue){
       planWorkItemRef = aValue;
    }

    public ENPlanWorkItemRef getPlanWorkItemRef(){
       return planWorkItemRef;
    }
    public void setElementRef(ENElementRef aValue){
       elementRef = aValue;
    }

    public ENElementRef getElementRef(){
       return elementRef;
    }

} // end of ENPWI2ElementValueObject


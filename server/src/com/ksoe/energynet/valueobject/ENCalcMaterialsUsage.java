
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENCalcMaterialsUsage;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;

import com.ksoe.energynet.valueobject.references.ENPlanWork2ClassificationTypeRef;
import com.ksoe.energynet.valueobject.references.ENPlanWorkRef;

public class ENCalcMaterialsUsage implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  numberGen = Integer.MIN_VALUE; 
    public String  classificationTypeNumber; 
    public String  materialName; 
    public String  measureUnitName; 
    public BigDecimal  priceGen; 
    public BigDecimal  countGen; 
    public BigDecimal  sumGen; 
    public long  modify_time = Long.MIN_VALUE;
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public ENPlanWork2ClassificationTypeRef plan2CTypeRef = new ENPlanWork2ClassificationTypeRef();
    public static final String tableName = "ENCALCMATERIALSUSAGE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENCALCMATERIALSUSAGE.CODE";
    public static final String numberGen_Attr = "numberGen";
    public static final String numberGen_Field = "NUMBERGEN";
    public static final String numberGen_QFielld = "ENCALCMATERIALSUSAGE.NUMBERGEN";
    public static final String classificationTypeNumber_Attr = "classificationTypeNumber";
    public static final String classificationTypeNumber_Field = "CLASSIFICATIONTYPENUMBER";
    public static final String classificationTypeNumber_QFielld = "ENCALCMATERIALSUSAGE.CLASSIFICATIONTYPENMBR";
    public static final String materialName_Attr = "materialName";
    public static final String materialName_Field = "MATERIALNAME";
    public static final String materialName_QFielld = "ENCALCMATERIALSUSAGE.MATERIALNAME";
    public static final String measureUnitName_Attr = "measureUnitName";
    public static final String measureUnitName_Field = "MEASUREUNITNAME";
    public static final String measureUnitName_QFielld = "ENCALCMATERIALSUSAGE.MEASUREUNITNAME";
    public static final String priceGen_Attr = "priceGen";
    public static final String priceGen_Field = "PRICEGEN";
    public static final String priceGen_QFielld = "ENCALCMATERIALSUSAGE.PRICEGEN";
    public static final String countGen_Attr = "countGen";
    public static final String countGen_Field = "COUNTGEN";
    public static final String countGen_QFielld = "ENCALCMATERIALSUSAGE.COUNTGEN";
    public static final String sumGen_Attr = "sumGen";
    public static final String sumGen_Field = "SUMGEN";
    public static final String sumGen_QFielld = "ENCALCMATERIALSUSAGE.SUMGEN";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENCALCMATERIALSUSAGE.MODIFY_TIME";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENCALCMATERIALSUSAGE.PLANREFCODE";
    public static final String plan2CTypeRef_Attr = "plan2CTypeRef";
    public static final String plan2CTypeRef_Field = "PLAN2CTYPEREFCODE";
    public static final String  plan2CTypeRef_QFielld = "ENCALCMATERIALSUSAGE.PLAN2CTYPEREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setNumberGen(int aValue){
       numberGen = aValue;
    }

    public int getNumberGen(){
       return numberGen;
    }

    public void setClassificationTypeNumber(String aValue){
       classificationTypeNumber = aValue;
    }

    public String getClassificationTypeNumber(){
       return classificationTypeNumber;
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

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setPlanRef(ENPlanWorkRef aValue){
       planRef = aValue;
    }

    public ENPlanWorkRef getPlanRef(){
       return planRef;
    }
    public void setPlan2CTypeRef(ENPlanWork2ClassificationTypeRef aValue){
       plan2CTypeRef = aValue;
    }

    public ENPlanWork2ClassificationTypeRef getPlan2CTypeRef(){
       return plan2CTypeRef;
    }

} // end of ENCalcMaterialsUsageValueObject


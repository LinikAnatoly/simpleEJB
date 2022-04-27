
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENAct2CostRecovery;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENActRef;
    import  com.ksoe.techcard.valueobject.references.TKClassificationTypeRef;

public class ENAct2CostRecovery implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public String  measureUnitName; 
    public BigDecimal  countGen; 
    public BigDecimal  price; 
    public BigDecimal  summa; 
    public ENActRef actRef = new ENActRef();
    public TKClassificationTypeRef classificationTypeRef = new TKClassificationTypeRef();
    public static final String tableName = "ENACT2COSTRECOVERY";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACT2COSTRECOVERY.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENACT2COSTRECOVERY.NAME";
    public static final String measureUnitName_Attr = "measureUnitName";
    public static final String measureUnitName_Field = "MEASUREUNITNAME";
    public static final String measureUnitName_QFielld = "ENACT2COSTRECOVERY.MEASUREUNITNAME";
    public static final String countGen_Attr = "countGen";
    public static final String countGen_Field = "COUNTGEN";
    public static final String countGen_QFielld = "ENACT2COSTRECOVERY.COUNTGEN";
    public static final String price_Attr = "price";
    public static final String price_Field = "PRICE";
    public static final String price_QFielld = "ENACT2COSTRECOVERY.PRICE";
    public static final String summa_Attr = "summa";
    public static final String summa_Field = "SUMMA";
    public static final String summa_QFielld = "ENACT2COSTRECOVERY.SUMMA";
    public static final String actRef_Attr = "actRef";
    public static final String actRef_Field = "ACTREFCODE";
    public static final String  actRef_QFielld = "ENACT2COSTRECOVERY.ACTREFCODE";
    public static final String classificationTypeRef_Attr = "classificationTypeRef";
    public static final String classificationTypeRef_Field = "CLASSIFICATIONTYPERFCD";
    public static final String  classificationTypeRef_QFielld = "ENACT2COSTRECOVERY.CLASSIFICATIONTYPERFCD";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }

    public void setMeasureUnitName(String aValue){
       measureUnitName = aValue;
    }

    public String getMeasureUnitName(){
       return measureUnitName;
    }

    public void setCountGen(BigDecimal aValue){
       countGen = aValue;
    }

    public BigDecimal getCountGen(){
       return countGen;
    }

    public void setPrice(BigDecimal aValue){
       price = aValue;
    }

    public BigDecimal getPrice(){
       return price;
    }

    public void setSumma(BigDecimal aValue){
       summa = aValue;
    }

    public BigDecimal getSumma(){
       return summa;
    }

    public void setActRef(ENActRef aValue){
       actRef = aValue;
    }

    public ENActRef getActRef(){
       return actRef;
    }
    public void setClassificationTypeRef(TKClassificationTypeRef aValue){
       classificationTypeRef = aValue;
    }

    public TKClassificationTypeRef getClassificationTypeRef(){
       return classificationTypeRef;
    }

} // end of ENAct2CostRecoveryValueObject


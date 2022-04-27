
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENServicesMaterials;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesCostRef;
import com.ksoe.techcard.valueobject.TKCalcMaterials;
import  com.ksoe.techcard.valueobject.references.TKCalcMaterialsRef;
    import  com.ksoe.techcard.valueobject.references.TKMaterialsRef;
    import  com.ksoe.techcard.valueobject.references.TKTechCardRef;

public class ENServicesMaterials implements Serializable {

private static final long serialVersionUID = 1L;

    /**
     * Переменная необходимая для сохранения транзитивного состояния расчета договора
     */
    public transient TKCalcMaterials calcMaterial = null;

    public int  code = Integer.MIN_VALUE;
    public String  materialName; 
    public String  measureUnitName; 
    public BigDecimal  priceGen; 
    public BigDecimal  countGen; 
    public BigDecimal  sumGen; 
    public ENServicesCostRef servicesCostRef = new ENServicesCostRef();
    public TKCalcMaterialsRef calcMaterialsRef = new TKCalcMaterialsRef();
    public TKMaterialsRef materialRef = new TKMaterialsRef();
    public TKTechCardRef kartaRef = new TKTechCardRef();
    public static final String tableName = "ENSERVICESMATERIALS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSERVICESMATERIALS.CODE";
    public static final String materialName_Attr = "materialName";
    public static final String materialName_Field = "MATERIALNAME";
    public static final String materialName_QFielld = "ENSERVICESMATERIALS.MATERIALNAME";
    public static final String measureUnitName_Attr = "measureUnitName";
    public static final String measureUnitName_Field = "MEASUREUNITNAME";
    public static final String measureUnitName_QFielld = "ENSERVICESMATERIALS.MEASUREUNITNAME";
    public static final String priceGen_Attr = "priceGen";
    public static final String priceGen_Field = "PRICEGEN";
    public static final String priceGen_QFielld = "ENSERVICESMATERIALS.PRICEGEN";
    public static final String countGen_Attr = "countGen";
    public static final String countGen_Field = "COUNTGEN";
    public static final String countGen_QFielld = "ENSERVICESMATERIALS.COUNTGEN";
    public static final String sumGen_Attr = "sumGen";
    public static final String sumGen_Field = "SUMGEN";
    public static final String sumGen_QFielld = "ENSERVICESMATERIALS.SUMGEN";
    public static final String servicesCostRef_Attr = "servicesCostRef";
    public static final String servicesCostRef_Field = "SERVICESCOSTREFCODE";
    public static final String  servicesCostRef_QFielld = "ENSERVICESMATERIALS.SERVICESCOSTREFCODE";
    public static final String calcMaterialsRef_Attr = "calcMaterialsRef";
    public static final String calcMaterialsRef_Field = "CALCMATERIALSREFCODE";
    public static final String  calcMaterialsRef_QFielld = "ENSERVICESMATERIALS.CALCMATERIALSREFCODE";
    public static final String materialRef_Attr = "materialRef";
    public static final String materialRef_Field = "MATERIALREFCODE";
    public static final String  materialRef_QFielld = "ENSERVICESMATERIALS.MATERIALREFCODE";
    public static final String kartaRef_Attr = "kartaRef";
    public static final String kartaRef_Field = "KARTAREFCODE";
    public static final String  kartaRef_QFielld = "ENSERVICESMATERIALS.KARTAREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
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

    public void setServicesCostRef(ENServicesCostRef aValue){
       servicesCostRef = aValue;
    }

    public ENServicesCostRef getServicesCostRef(){
       return servicesCostRef;
    }
    public void setCalcMaterialsRef(TKCalcMaterialsRef aValue){
       calcMaterialsRef = aValue;
    }

    public TKCalcMaterialsRef getCalcMaterialsRef(){
       return calcMaterialsRef;
    }
    public void setMaterialRef(TKMaterialsRef aValue){
       materialRef = aValue;
    }

    public TKMaterialsRef getMaterialRef(){
       return materialRef;
    }
    public void setKartaRef(TKTechCardRef aValue){
       kartaRef = aValue;
    }

    public TKTechCardRef getKartaRef(){
       return kartaRef;
    }

} // end of ENServicesMaterialsValueObject


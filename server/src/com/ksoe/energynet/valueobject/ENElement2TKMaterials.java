
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENElement2TKMaterials;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.techcard.valueobject.references.TKMaterialsRef;
    import  com.ksoe.energynet.valueobject.references.ENElementRef;
    import  com.ksoe.energynet.valueobject.references.ENElement2TKMaterialsTypeRef;

public class ENElement2TKMaterials implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public TKMaterialsRef materialRef = new TKMaterialsRef();
    public ENElementRef elementRef = new ENElementRef();
    public ENElement2TKMaterialsTypeRef typeRef = new ENElement2TKMaterialsTypeRef();
    public static final String tableName = "ENELEMENT2TKMATERIALS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENELEMENT2TKMATERIALS.CODE";
    public static final String materialRef_Attr = "materialRef";
    public static final String materialRef_Field = "MATERIALREFCODE";
    public static final String  materialRef_QFielld = "ENELEMENT2TKMATERIALS.MATERIALREFCODE";
    public static final String elementRef_Attr = "elementRef";
    public static final String elementRef_Field = "ELEMENTREFCODE";
    public static final String  elementRef_QFielld = "ENELEMENT2TKMATERIALS.ELEMENTREFCODE";
    public static final String typeRef_Attr = "typeRef";
    public static final String typeRef_Field = "TYPEREFCODE";
    public static final String  typeRef_QFielld = "ENELEMENT2TKMATERIALS.TYPEREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setMaterialRef(TKMaterialsRef aValue){
       materialRef = aValue;
    }

    public TKMaterialsRef getMaterialRef(){
       return materialRef;
    }
    public void setElementRef(ENElementRef aValue){
       elementRef = aValue;
    }

    public ENElementRef getElementRef(){
       return elementRef;
    }
    public void setTypeRef(ENElement2TKMaterialsTypeRef aValue){
       typeRef = aValue;
    }

    public ENElement2TKMaterialsTypeRef getTypeRef(){
       return typeRef;
    }

} // end of ENElement2TKMaterialsValueObject


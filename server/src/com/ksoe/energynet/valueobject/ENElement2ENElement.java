
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENElement2ENElement;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENElementRef;
    import  com.ksoe.energynet.valueobject.references.ENElementRef;
    import  com.ksoe.energynet.valueobject.references.ENElement2ENElementTypeRef;

public class ENElement2ENElement implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE; 
    public ENElementRef elementInRef = new ENElementRef();
    public ENElementRef elementOutRef = new ENElementRef();
    public ENElement2ENElementTypeRef typeRef = new ENElement2ENElementTypeRef();
    public static final String tableName = "ENELEMENT2ENELEMENT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENELEMENT2ENELEMENT.CODE";
    public static final String elementInRef_Attr = "elementInRef";
    public static final String elementInRef_Field = "ELEMENTINREFCODE";
    public static final String  elementInRef_QFielld = "ENELEMENT2ENELEMENT.ELEMENTINREFCODE";
    public static final String elementOutRef_Attr = "elementOutRef";
    public static final String elementOutRef_Field = "ELEMENTOUTREFCODE";
    public static final String  elementOutRef_QFielld = "ENELEMENT2ENELEMENT.ELEMENTOUTREFCODE";
    public static final String typeRef_Attr = "typeRef";
    public static final String typeRef_Field = "TYPEREFCODE";
    public static final String  typeRef_QFielld = "ENELEMENT2ENELEMENT.TYPEREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setElementInRef(ENElementRef aValue){
       elementInRef = aValue;
    }

    public ENElementRef getElementInRef(){
       return elementInRef;
    }
    public void setElementOutRef(ENElementRef aValue){
       elementOutRef = aValue;
    }

    public ENElementRef getElementOutRef(){
       return elementOutRef;
    }
    public void setTypeRef(ENElement2ENElementTypeRef aValue){
       typeRef = aValue;
    }

    public ENElement2ENElementTypeRef getTypeRef(){
       return typeRef;
    }

} // end of ENElement2ENElementValueObject


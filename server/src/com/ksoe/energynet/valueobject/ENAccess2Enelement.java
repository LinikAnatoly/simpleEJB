
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENAccess2Enelement;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENElementRef;

public class ENAccess2Enelement implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  isAccess = Integer.MIN_VALUE; 
    public ENElementRef elementRef = new ENElementRef();
    public static final String tableName = "ENACCESS2ENELEMENT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENACCESS2ENELEMENT.CODE";
    public static final String isAccess_Attr = "isAccess";
    public static final String isAccess_Field = "ISACCESS";
    public static final String isAccess_QFielld = "ENACCESS2ENELEMENT.ISACCESS";
    public static final String elementRef_Attr = "elementRef";
    public static final String elementRef_Field = "ELEMENTREFCODE";
    public static final String  elementRef_QFielld = "ENACCESS2ENELEMENT.ELEMENTREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setIsAccess(int aValue){
       isAccess = aValue;
    }

    public int getIsAccess(){
       return isAccess;
    }

    public void setElementRef(ENElementRef aValue){
       elementRef = aValue;
    }

    public ENElementRef getElementRef(){
       return elementRef;
    }

} // end of ENAccess2EnelementValueObject


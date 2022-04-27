
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENDestinationPoint2Point;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENElementRef;
    import  com.ksoe.energynet.valueobject.references.ENElementRef;

public class ENDestinationPoint2Point implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  distance; 
    public ENElementRef elementInRef = new ENElementRef();
    public ENElementRef elementOutRef = new ENElementRef();
    public static final String tableName = "ENDESTINATIONPOINT2PNT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENDESTINATIONPOINT2PNT.CODE";
    public static final String distance_Attr = "distance";
    public static final String distance_Field = "DISTANCE";
    public static final String distance_QFielld = "ENDESTINATIONPOINT2PNT.DISTANCE";
    public static final String elementInRef_Attr = "elementInRef";
    public static final String elementInRef_Field = "ELEMENTINREFCODE";
    public static final String  elementInRef_QFielld = "ENDESTINATIONPOINT2PNT.ELEMENTINREFCODE";
    public static final String elementOutRef_Attr = "elementOutRef";
    public static final String elementOutRef_Field = "ELEMENTOUTREFCODE";
    public static final String  elementOutRef_QFielld = "ENDESTINATIONPOINT2PNT.ELEMENTOUTREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setDistance(BigDecimal aValue){
       distance = aValue;
    }

    public BigDecimal getDistance(){
       return distance;
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

} // end of ENDestinationPoint2PointValueObject


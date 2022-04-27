
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTransportRouteDistance;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENTransportRouteRef;

public class ENTransportRouteDistance implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  distance; 
    public BigDecimal  koef; 
    public ENTransportRouteRef transportRouteRef = new ENTransportRouteRef();
    public static final String tableName = "ENTRANSPORTROUTEDISTNC";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTRANSPORTROUTEDISTNC.CODE";
    public static final String distance_Attr = "distance";
    public static final String distance_Field = "DISTANCE";
    public static final String distance_QFielld = "ENTRANSPORTROUTEDISTNC.DISTANCE";
    public static final String koef_Attr = "koef";
    public static final String koef_Field = "KOEF";
    public static final String koef_QFielld = "ENTRANSPORTROUTEDISTNC.KOEF";
    public static final String transportRouteRef_Attr = "transportRouteRef";
    public static final String transportRouteRef_Field = "TRANSPORTROUTEREFCODE";
    public static final String  transportRouteRef_QFielld = "ENTRANSPORTROUTEDISTNC.TRANSPORTROUTEREFCODE";


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

    public void setKoef(BigDecimal aValue){
       koef = aValue;
    }

    public BigDecimal getKoef(){
       return koef;
    }

    public void setTransportRouteRef(ENTransportRouteRef aValue){
       transportRouteRef = aValue;
    }

    public ENTransportRouteRef getTransportRouteRef(){
       return transportRouteRef;
    }

} // end of ENTransportRouteDistanceValueObject


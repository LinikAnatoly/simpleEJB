
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTransportRouteDistance2TKFuelKoef;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENTransportRouteDistanceRef;
    import  com.ksoe.techcard.valueobject.references.TKFuelKoefRef;

public class ENTransportRouteDistance2TKFuelKoef implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public ENTransportRouteDistanceRef transportRouteDistanceRef = new ENTransportRouteDistanceRef();
    public TKFuelKoefRef tkFuelKoefRef = new TKFuelKoefRef();
    public static final String tableName = "NTRNSPRTRTDSTNC2TKFLKF";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "NTRNSPRTRTDSTNC2TKFLKF.CODE";
    public static final String transportRouteDistanceRef_Attr = "transportRouteDistanceRef";
    public static final String transportRouteDistanceRef_Field = "TRANSPORTROUTDSTNCRFCD";
    public static final String  transportRouteDistanceRef_QFielld = "NTRNSPRTRTDSTNC2TKFLKF.TRANSPORTROUTDSTNCRFCD";
    public static final String tkFuelKoefRef_Attr = "tkFuelKoefRef";
    public static final String tkFuelKoefRef_Field = "TKFUELKOEFREFCODE";
    public static final String  tkFuelKoefRef_QFielld = "NTRNSPRTRTDSTNC2TKFLKF.TKFUELKOEFREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setTransportRouteDistanceRef(ENTransportRouteDistanceRef aValue){
       transportRouteDistanceRef = aValue;
    }

    public ENTransportRouteDistanceRef getTransportRouteDistanceRef(){
       return transportRouteDistanceRef;
    }
    public void setTkFuelKoefRef(TKFuelKoefRef aValue){
       tkFuelKoefRef = aValue;
    }

    public TKFuelKoefRef getTkFuelKoefRef(){
       return tkFuelKoefRef;
    }

} // end of ENTransportRouteDistance2TKFuelKoefValueObject


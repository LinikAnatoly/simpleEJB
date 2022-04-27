
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTransportRoute2RQFKOrder;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.rqorder.valueobject.references.RQFKOrderRef;
    import  com.ksoe.energynet.valueobject.references.ENTransportRouteRef;

public class ENTransportRoute2RQFKOrder implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public RQFKOrderRef fkOrderRef = new RQFKOrderRef();
    public ENTransportRouteRef transportRouteRef = new ENTransportRouteRef();
    public static final String tableName = "ENTRANSPORTROT2RQFKRDR";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTRANSPORTROT2RQFKRDR.CODE";
    public static final String fkOrderRef_Attr = "fkOrderRef";
    public static final String fkOrderRef_Field = "FKORDERREFCODE";
    public static final String  fkOrderRef_QFielld = "ENTRANSPORTROT2RQFKRDR.FKORDERREFCODE";
    public static final String transportRouteRef_Attr = "transportRouteRef";
    public static final String transportRouteRef_Field = "TRANSPORTROUTEREFCODE";
    public static final String  transportRouteRef_QFielld = "ENTRANSPORTROT2RQFKRDR.TRANSPORTROUTEREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setFkOrderRef(RQFKOrderRef aValue){
       fkOrderRef = aValue;
    }

    public RQFKOrderRef getFkOrderRef(){
       return fkOrderRef;
    }
    public void setTransportRouteRef(ENTransportRouteRef aValue){
       transportRouteRef = aValue;
    }

    public ENTransportRouteRef getTransportRouteRef(){
       return transportRouteRef;
    }

} // end of ENTransportRoute2RQFKOrderValueObject


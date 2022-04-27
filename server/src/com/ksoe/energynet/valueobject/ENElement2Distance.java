
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENElement2Distance;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENElementRef;
    import  com.ksoe.energynet.valueobject.references.ENTransportDepartmentRef;

public class ENElement2Distance implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public BigDecimal  distance; 

    public ENElementRef elementRef = new ENElementRef();
    public ENTransportDepartmentRef transportDepartment = new ENTransportDepartmentRef();

    public static final String tableName = "ENELEMENT2DISTANCE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENELEMENT2DISTANCE.CODE";
    public static final String distance_Attr = "distance";
    public static final String distance_Field = "DISTANCE";
    public static final String distance_QFielld = "ENELEMENT2DISTANCE.DISTANCE";

    public static final String elementRef_Attr = "elementRef";
    public static final String elementRef_Field = "ELEMENTREFCODE";
    public static final String  elementRef_QFielld = "ENELEMENT2DISTANCE.ELEMENTREFCODE";
    public static final String transportDepartment_Attr = "transportDepartment";
    public static final String transportDepartment_Field = "TRANSPORTDEPARTMENTCOD";
    public static final String  transportDepartment_QFielld = "ENELEMENT2DISTANCE.TRANSPORTDEPARTMENTCOD";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public BigDecimal getDistance(){
       return distance;
    }
    
    public void setDistance(BigDecimal distance){
       this.distance = distance;
    }

    public ENElementRef getElementRef(){
       return elementRef;
    }
    
    public void setElementRef(ENElementRef elementRef){
       this.elementRef = elementRef;
    }
    public ENTransportDepartmentRef getTransportDepartment(){
       return transportDepartment;
    }
    
    public void setTransportDepartment(ENTransportDepartmentRef transportDepartment){
       this.transportDepartment = transportDepartment;
    }

} // end of ENElement2DistanceValueObject


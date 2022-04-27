
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENServicesTransport;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesCostRef;
    import  com.ksoe.techcard.valueobject.references.TKCalcTransportRef;

public class ENServicesTransport implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE;
	public String transportName;
    public BigDecimal  machineHoursCount; 
    public BigDecimal  distance; 
    public BigDecimal  costMachineHours; 
    public BigDecimal  costDistance; 
    public BigDecimal  costTotal; 
    public ENServicesCostRef servicesCostRef = new ENServicesCostRef();
    public TKCalcTransportRef calcTransportRef = new TKCalcTransportRef();
    public static final String tableName = "ENSERVICESTRANSPORT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSERVICESTRANSPORT.CODE";
    public static final String machineHoursCount_Attr = "machineHoursCount";
    public static final String machineHoursCount_Field = "MACHINEHOURSCOUNT";
    public static final String machineHoursCount_QFielld = "ENSERVICESTRANSPORT.MACHINEHOURSCOUNT";
    public static final String distance_Attr = "distance";
    public static final String distance_Field = "DISTANCE";
    public static final String distance_QFielld = "ENSERVICESTRANSPORT.DISTANCE";
    public static final String costMachineHours_Attr = "costMachineHours";
    public static final String costMachineHours_Field = "COSTMACHINEHOURS";
    public static final String costMachineHours_QFielld = "ENSERVICESTRANSPORT.COSTMACHINEHOURS";
    public static final String costDistance_Attr = "costDistance";
    public static final String costDistance_Field = "COSTDISTANCE";
    public static final String costDistance_QFielld = "ENSERVICESTRANSPORT.COSTDISTANCE";
    public static final String costTotal_Attr = "costTotal";
    public static final String costTotal_Field = "COSTTOTAL";
    public static final String costTotal_QFielld = "ENSERVICESTRANSPORT.COSTTOTAL";
    public static final String servicesCostRef_Attr = "servicesCostRef";
    public static final String servicesCostRef_Field = "SERVICESCOSTREFCODE";
    public static final String  servicesCostRef_QFielld = "ENSERVICESTRANSPORT.SERVICESCOSTREFCODE";
    public static final String calcTransportRef_Attr = "calcTransportRef";
    public static final String calcTransportRef_Field = "CALCTRANSPORTREFCODE";
    public static final String  calcTransportRef_QFielld = "ENSERVICESTRANSPORT.CALCTRANSPORTREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    
	public void setTransportName(String aValue){
		transportName = aValue;
	}

	public String getTransportName(){
		return transportName;
	}

    public void setMachineHoursCount(BigDecimal aValue){
       machineHoursCount = aValue;
    }

    public BigDecimal getMachineHoursCount(){
       return machineHoursCount;
    }


    public void setDistance(BigDecimal aValue){
       distance = aValue;
    }

    public BigDecimal getDistance(){
       return distance;
    }


    public void setCostMachineHours(BigDecimal aValue){
       costMachineHours = aValue;
    }

    public BigDecimal getCostMachineHours(){
       return costMachineHours;
    }


    public void setCostDistance(BigDecimal aValue){
       costDistance = aValue;
    }

    public BigDecimal getCostDistance(){
       return costDistance;
    }


    public void setCostTotal(BigDecimal aValue){
       costTotal = aValue;
    }

    public BigDecimal getCostTotal(){
       return costTotal;
    }

    public void setServicesCostRef(ENServicesCostRef aValue){
       servicesCostRef = aValue;
    }

    public ENServicesCostRef getServicesCostRef(){
       return servicesCostRef;
    }
    public void setCalcTransportRef(TKCalcTransportRef aValue){
       calcTransportRef = aValue;
    }

    public TKCalcTransportRef getCalcTransportRef(){
       return calcTransportRef;
    }

} // end of ENServicesTransportValueObject


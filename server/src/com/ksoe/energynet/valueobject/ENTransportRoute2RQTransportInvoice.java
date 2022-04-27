
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTransportRoute2RQTransportInvoice;
  */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.ENTransportRouteRef;
import com.ksoe.rqorder.valueobject.references.RQTransportInvoiceRef;

public class ENTransportRoute2RQTransportInvoice implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public RQTransportInvoiceRef invoiceRef = new RQTransportInvoiceRef();
    public ENTransportRouteRef transportRouteRef = new ENTransportRouteRef();
    public static final String tableName = "NTRNSPRTRT2RQTRNSPRTNV";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "NTRNSPRTRT2RQTRNSPRTNV.CODE";
    public static final String invoiceRef_Attr = "invoiceRef";
    public static final String invoiceRef_Field = "INVOICEREFCODE";
    public static final String  invoiceRef_QFielld = "NTRNSPRTRT2RQTRNSPRTNV.INVOICEREFCODE";
    public static final String transportRouteRef_Attr = "transportRouteRef";
    public static final String transportRouteRef_Field = "TRANSPORTROUTEREFCODE";
    public static final String  transportRouteRef_QFielld = "NTRNSPRTRT2RQTRNSPRTNV.TRANSPORTROUTEREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setInvoiceRef(RQTransportInvoiceRef aValue){
       invoiceRef = aValue;
    }

    public RQTransportInvoiceRef getInvoiceRef(){
       return invoiceRef;
    }
    public void setTransportRouteRef(ENTransportRouteRef aValue){
       transportRouteRef = aValue;
    }

    public ENTransportRouteRef getTransportRouteRef(){
       return transportRouteRef;
    }

} // end of ENTransportRoute2RQTransportInvoiceValueObject


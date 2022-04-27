
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTransportOrder2TransportItem;  	
  */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.ENTransportItemRef;
import com.ksoe.energynet.valueobject.references.ENTransportOrderRef;

public class ENTransportOrder2TransportItem implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public ENTransportOrderRef transportOrder = new ENTransportOrderRef();
    public ENTransportItemRef transportItem = new ENTransportItemRef();
    public static final String tableName = "ENTRNSPRTRDR2TRNSPRTTM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTRNSPRTRDR2TRNSPRTTM.CODE";
    public static final String transportOrder_Attr = "transportOrder";
    public static final String transportOrder_Field = "TRANSPORTORDERCODE";
    public static final String  transportOrder_QFielld = "ENTRNSPRTRDR2TRNSPRTTM.TRANSPORTORDERCODE";
    public static final String transportItem_Attr = "transportItem";
    public static final String transportItem_Field = "TRANSPORTITEMCODE";
    public static final String  transportItem_QFielld = "ENTRNSPRTRDR2TRNSPRTTM.TRANSPORTITEMCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setTransportOrder(ENTransportOrderRef aValue){
       transportOrder = aValue;
    }

    public ENTransportOrderRef getTransportOrder(){
       return transportOrder;
    }
    public void setTransportItem(ENTransportItemRef aValue){
       transportItem = aValue;
    }

    public ENTransportItemRef getTransportItem(){
       return transportItem;
    }

} // end of ENTransportOrder2TransportItemValueObject


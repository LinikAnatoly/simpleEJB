
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENServicesObject2RQFKOrder;
  */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.ENServicesObjectRef;
import com.ksoe.rqorder.valueobject.references.RQFKOrderRef;

public class ENServicesObject2RQFKOrder implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public ENServicesObjectRef servicesObjectRef = new ENServicesObjectRef();
    public RQFKOrderRef fkOrderRef = new RQFKOrderRef();
    public static final String tableName = "ENSERVICESBJCT2RQFKRDR";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSERVICESBJCT2RQFKRDR.CODE";
    public static final String servicesObjectRef_Attr = "servicesObjectRef";
    public static final String servicesObjectRef_Field = "SERVICESOBJECTREFCODE";
    public static final String  servicesObjectRef_QFielld = "ENSERVICESBJCT2RQFKRDR.SERVICESOBJECTREFCODE";
    public static final String fkOrderRef_Attr = "fkOrderRef";
    public static final String fkOrderRef_Field = "FKORDERREFCODE";
    public static final String  fkOrderRef_QFielld = "ENSERVICESBJCT2RQFKRDR.FKORDERREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setServicesObjectRef(ENServicesObjectRef aValue){
       servicesObjectRef = aValue;
    }

    public ENServicesObjectRef getServicesObjectRef(){
       return servicesObjectRef;
    }
    public void setFkOrderRef(RQFKOrderRef aValue){
       fkOrderRef = aValue;
    }

    public RQFKOrderRef getFkOrderRef(){
       return fkOrderRef;
    }

} // end of ENServicesObject2RQFKOrderValueObject


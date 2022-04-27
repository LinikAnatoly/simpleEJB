
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENCalcPowerReserve;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENServicesObjectRef;
    import  com.ksoe.netobjects.valueobject.references.ENGauge150Ref;
    import  com.ksoe.netobjects.valueobject.references.ENFiderGuageRef;

public class ENCalcPowerReserve implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public long  modify_time = Long.MIN_VALUE;
    public String  userAdd; 
    public Date dateAdd ;
    public String  userGen; 
    public Date dateEdit ;
    public ENServicesObjectRef servicesobjectRef = new ENServicesObjectRef();
    public ENGauge150Ref gauge150Ref = new ENGauge150Ref();
    public ENFiderGuageRef gaugeRef = new ENFiderGuageRef();
    public static final String tableName = "ENCALCPOWERRESERVE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENCALCPOWERRESERVE.CODE";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENCALCPOWERRESERVE.MODIFY_TIME";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "ENCALCPOWERRESERVE.USERADD";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENCALCPOWERRESERVE.DATEADD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENCALCPOWERRESERVE.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENCALCPOWERRESERVE.DATEEDIT";
    public static final String servicesobjectRef_Attr = "servicesobjectRef";
    public static final String servicesobjectRef_Field = "SERVICESOBJECTREFCODE";
    public static final String  servicesobjectRef_QFielld = "ENCALCPOWERRESERVE.SERVICESOBJECTREFCODE";
    public static final String gauge150Ref_Attr = "gauge150Ref";
    public static final String gauge150Ref_Field = "GAUGE150REFCODE";
    public static final String  gauge150Ref_QFielld = "ENCALCPOWERRESERVE.GAUGE150REFCODE";
    public static final String gaugeRef_Attr = "gaugeRef";
    public static final String gaugeRef_Field = "GAUGEREFCODE";
    public static final String  gaugeRef_QFielld = "ENCALCPOWERRESERVE.GAUGEREFCODE";



    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }


    public void setUserAdd(String aValue){
       userAdd = aValue;
    }

    public String getUserAdd(){
       return userAdd;
    }


    public void setDateAdd(Date aValue){
       dateAdd = aValue;
    }

    public Date getDateAdd(){
       return dateAdd;
    }


    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }


    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }

    public void setServicesobjectRef(ENServicesObjectRef aValue){
       servicesobjectRef = aValue;
    }

    public ENServicesObjectRef getServicesobjectRef(){
       return servicesobjectRef;
    }
    public void setGauge150Ref(ENGauge150Ref aValue){
       gauge150Ref = aValue;
    }

    public ENGauge150Ref getGauge150Ref(){
       return gauge150Ref;
    }
    public void setGaugeRef(ENFiderGuageRef aValue){
       gaugeRef = aValue;
    }

    public ENFiderGuageRef getGaugeRef(){
       return gaugeRef;
    }

} // end of ENCalcPowerReserveValueObject


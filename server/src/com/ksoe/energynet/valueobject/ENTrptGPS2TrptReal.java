
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTrptGPS2TrptReal;  	
  */

import java.io.Serializable;

import com.ksoe.techcard.valueobject.TKTransportReal;

public class ENTrptGPS2TrptReal implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  codeTranpostGps; 
    public TKTransportReal realTransport = new TKTransportReal();
    public static final String tableName = "ENTRPTGPS2TRPTREAL";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTRPTGPS2TRPTREAL.CODE";
    public static final String codeTranpostGps_Attr = "codeTranpostGps";
    public static final String codeTranpostGps_Field = "CODETRANPOSTGPS";
    public static final String codeTranpostGps_QFielld = "ENTRPTGPS2TRPTREAL.CODETRANPOSTGPS";
    public static final String realTransport_Attr = "realTransport";
    public static final String realTransport_Field = "REALTRANSPORTCODE";
    public static final String  realTransport_QFielld = "ENTRPTGPS2TRPTREAL.REALTRANSPORTCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setCodeTranpostGps(String aValue){
       codeTranpostGps = aValue;
    }

    public String getCodeTranpostGps(){
       return codeTranpostGps;
    }

    public void setRealTransport(TKTransportReal aValue){
       realTransport = aValue;
    }

    public TKTransportReal getRealTransport(){
       return realTransport;
    }

} // end of ENTrptGPS2TrptRealValueObject



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTrptGPS2TrptReal;  	
  */

import java.io.Serializable;


public class ENTrptGPS2TrptRealShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String codeTranpostGps;
    public int realTransportCode = Integer.MIN_VALUE;
    public String realTransportName;
    public String realTransportInvNumber;
    public String realTransportGosNumber;

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


    public void setRealTransportCode(int aValue){
       realTransportCode = aValue;
    }
    public int getRealTransportCode(){
       return realTransportCode;
    }

    public void setRealTransportName(String aValue){
       realTransportName = aValue;
    }
    public String getRealTransportName(){
       return realTransportName;
    }

    public void setRealTransportInvNumber(String aValue){
       realTransportInvNumber = aValue;
    }
    public String getRealTransportInvNumber(){
       return realTransportInvNumber;
    }

    public void setRealTransportGosNumber(String aValue){
       realTransportGosNumber = aValue;
    }
    public String getRealTransportGosNumber(){
       return realTransportGosNumber;
    }



}
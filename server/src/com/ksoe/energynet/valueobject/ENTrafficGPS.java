
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTrafficGPS;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.ksoe.techcard.valueobject.TKTransportReal;

public class ENTrafficGPS implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public Date dateGen ;
    public BigDecimal  sumKm; 
    public BigDecimal  sumFuel; 
    public TKTransportReal realTransport = new TKTransportReal();
    public static final String tableName = "ENTRAFFICGPS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTRAFFICGPS.CODE";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENTRAFFICGPS.DATEGEN";
    public static final String sumKm_Attr = "sumKm";
    public static final String sumKm_Field = "SUMKM";
    public static final String sumKm_QFielld = "ENTRAFFICGPS.SUMKM";
    public static final String sumFuel_Attr = "sumFuel";
    public static final String sumFuel_Field = "SUMFUEL";
    public static final String sumFuel_QFielld = "ENTRAFFICGPS.SUMFUEL";
    public static final String realTransport_Attr = "realTransport";
    public static final String realTransport_Field = "REALTRANSPORTCODE";
    public static final String  realTransport_QFielld = "ENTRAFFICGPS.REALTRANSPORTCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setDateGen(Date aValue){
       dateGen = aValue;
    }

    public Date getDateGen(){
       return dateGen;
    }

    public void setSumKm(BigDecimal aValue){
       sumKm = aValue;
    }

    public BigDecimal getSumKm(){
       return sumKm;
    }

    public void setSumFuel(BigDecimal aValue){
       sumFuel = aValue;
    }

    public BigDecimal getSumFuel(){
       return sumFuel;
    }

    public void setRealTransport(TKTransportReal aValue){
       realTransport = aValue;
    }

    public TKTransportReal getRealTransport(){
       return realTransport;
    }

} // end of ENTrafficGPSValueObject


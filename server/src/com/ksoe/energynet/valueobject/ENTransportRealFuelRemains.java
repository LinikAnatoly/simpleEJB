
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTransportRealFuelRemains;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.techcard.valueobject.references.TKFuelTypeRef;
    import  com.ksoe.techcard.valueobject.TKTransportReal;
    import  com.ksoe.energynet.valueobject.references.ENTravelSheetFuelTypeRef;

public class ENTransportRealFuelRemains implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public Date dateStart ;
    public Date dateFinal ;
    public BigDecimal  countGenStart; 
    public BigDecimal  priceGenStart; 
    public BigDecimal  sumGenStart; 
    public BigDecimal  countGenIn; 
    public BigDecimal  priceGenIn; 
    public BigDecimal  sumGenIn; 
    public BigDecimal  countGenOut; 
    public BigDecimal  priceGenOut; 
    public BigDecimal  sumGenOut; 
    public BigDecimal  countGenFinal; 
    public BigDecimal  priceGenFinal; 
    public BigDecimal  sumGenFinal; 
    public long  modify_time = Long.MIN_VALUE;
    public TKFuelTypeRef fuelTypeRef = new TKFuelTypeRef();
    public TKTransportReal realTransport = new TKTransportReal();
    public ENTravelSheetFuelTypeRef travelSheetFuelTypeRef = new ENTravelSheetFuelTypeRef();
    public static final String tableName = "ENTRANSPORTREALFULRMNS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTRANSPORTREALFULRMNS.CODE";
    public static final String dateStart_Attr = "dateStart";
    public static final String dateStart_Field = "DATESTART";
    public static final String dateStart_QFielld = "ENTRANSPORTREALFULRMNS.DATESTART";
    public static final String dateFinal_Attr = "dateFinal";
    public static final String dateFinal_Field = "DATEFINAL";
    public static final String dateFinal_QFielld = "ENTRANSPORTREALFULRMNS.DATEFINAL";
    public static final String countGenStart_Attr = "countGenStart";
    public static final String countGenStart_Field = "COUNTGENSTART";
    public static final String countGenStart_QFielld = "ENTRANSPORTREALFULRMNS.COUNTGENSTART";
    public static final String priceGenStart_Attr = "priceGenStart";
    public static final String priceGenStart_Field = "PRICEGENSTART";
    public static final String priceGenStart_QFielld = "ENTRANSPORTREALFULRMNS.PRICEGENSTART";
    public static final String sumGenStart_Attr = "sumGenStart";
    public static final String sumGenStart_Field = "SUMGENSTART";
    public static final String sumGenStart_QFielld = "ENTRANSPORTREALFULRMNS.SUMGENSTART";
    public static final String countGenIn_Attr = "countGenIn";
    public static final String countGenIn_Field = "COUNTGENIN";
    public static final String countGenIn_QFielld = "ENTRANSPORTREALFULRMNS.COUNTGENIN";
    public static final String priceGenIn_Attr = "priceGenIn";
    public static final String priceGenIn_Field = "PRICEGENIN";
    public static final String priceGenIn_QFielld = "ENTRANSPORTREALFULRMNS.PRICEGENIN";
    public static final String sumGenIn_Attr = "sumGenIn";
    public static final String sumGenIn_Field = "SUMGENIN";
    public static final String sumGenIn_QFielld = "ENTRANSPORTREALFULRMNS.SUMGENIN";
    public static final String countGenOut_Attr = "countGenOut";
    public static final String countGenOut_Field = "COUNTGENOUT";
    public static final String countGenOut_QFielld = "ENTRANSPORTREALFULRMNS.COUNTGENOUT";
    public static final String priceGenOut_Attr = "priceGenOut";
    public static final String priceGenOut_Field = "PRICEGENOUT";
    public static final String priceGenOut_QFielld = "ENTRANSPORTREALFULRMNS.PRICEGENOUT";
    public static final String sumGenOut_Attr = "sumGenOut";
    public static final String sumGenOut_Field = "SUMGENOUT";
    public static final String sumGenOut_QFielld = "ENTRANSPORTREALFULRMNS.SUMGENOUT";
    public static final String countGenFinal_Attr = "countGenFinal";
    public static final String countGenFinal_Field = "COUNTGENFINAL";
    public static final String countGenFinal_QFielld = "ENTRANSPORTREALFULRMNS.COUNTGENFINAL";
    public static final String priceGenFinal_Attr = "priceGenFinal";
    public static final String priceGenFinal_Field = "PRICEGENFINAL";
    public static final String priceGenFinal_QFielld = "ENTRANSPORTREALFULRMNS.PRICEGENFINAL";
    public static final String sumGenFinal_Attr = "sumGenFinal";
    public static final String sumGenFinal_Field = "SUMGENFINAL";
    public static final String sumGenFinal_QFielld = "ENTRANSPORTREALFULRMNS.SUMGENFINAL";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENTRANSPORTREALFULRMNS.MODIFY_TIME";
    public static final String fuelTypeRef_Attr = "fuelTypeRef";
    public static final String fuelTypeRef_Field = "FUELTYPEREFCODE";
    public static final String  fuelTypeRef_QFielld = "ENTRANSPORTREALFULRMNS.FUELTYPEREFCODE";
    public static final String realTransport_Attr = "realTransport";
    public static final String realTransport_Field = "REALTRANSPORTCODE";
    public static final String  realTransport_QFielld = "ENTRANSPORTREALFULRMNS.REALTRANSPORTCODE";
    public static final String travelSheetFuelTypeRef_Attr = "travelSheetFuelTypeRef";
    public static final String travelSheetFuelTypeRef_Field = "TRAVELSHEETFUELTYPRFCD";
    public static final String  travelSheetFuelTypeRef_QFielld = "ENTRANSPORTREALFULRMNS.TRAVELSHEETFUELTYPRFCD";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setDateStart(Date aValue){
       dateStart = aValue;
    }

    public Date getDateStart(){
       return dateStart;
    }


    public void setDateFinal(Date aValue){
       dateFinal = aValue;
    }

    public Date getDateFinal(){
       return dateFinal;
    }

    public void setCountGenStart(BigDecimal aValue){
       countGenStart = aValue;
    }

    public BigDecimal getCountGenStart(){
       return countGenStart;
    }

    public void setPriceGenStart(BigDecimal aValue){
       priceGenStart = aValue;
    }

    public BigDecimal getPriceGenStart(){
       return priceGenStart;
    }

    public void setSumGenStart(BigDecimal aValue){
       sumGenStart = aValue;
    }

    public BigDecimal getSumGenStart(){
       return sumGenStart;
    }

    public void setCountGenIn(BigDecimal aValue){
       countGenIn = aValue;
    }

    public BigDecimal getCountGenIn(){
       return countGenIn;
    }

    public void setPriceGenIn(BigDecimal aValue){
       priceGenIn = aValue;
    }

    public BigDecimal getPriceGenIn(){
       return priceGenIn;
    }

    public void setSumGenIn(BigDecimal aValue){
       sumGenIn = aValue;
    }

    public BigDecimal getSumGenIn(){
       return sumGenIn;
    }

    public void setCountGenOut(BigDecimal aValue){
       countGenOut = aValue;
    }

    public BigDecimal getCountGenOut(){
       return countGenOut;
    }

    public void setPriceGenOut(BigDecimal aValue){
       priceGenOut = aValue;
    }

    public BigDecimal getPriceGenOut(){
       return priceGenOut;
    }

    public void setSumGenOut(BigDecimal aValue){
       sumGenOut = aValue;
    }

    public BigDecimal getSumGenOut(){
       return sumGenOut;
    }

    public void setCountGenFinal(BigDecimal aValue){
       countGenFinal = aValue;
    }

    public BigDecimal getCountGenFinal(){
       return countGenFinal;
    }

    public void setPriceGenFinal(BigDecimal aValue){
       priceGenFinal = aValue;
    }

    public BigDecimal getPriceGenFinal(){
       return priceGenFinal;
    }

    public void setSumGenFinal(BigDecimal aValue){
       sumGenFinal = aValue;
    }

    public BigDecimal getSumGenFinal(){
       return sumGenFinal;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setFuelTypeRef(TKFuelTypeRef aValue){
       fuelTypeRef = aValue;
    }

    public TKFuelTypeRef getFuelTypeRef(){
       return fuelTypeRef;
    }
    public void setRealTransport(TKTransportReal aValue){
       realTransport = aValue;
    }

    public TKTransportReal getRealTransport(){
       return realTransport;
    }
    public void setTravelSheetFuelTypeRef(ENTravelSheetFuelTypeRef aValue){
       travelSheetFuelTypeRef = aValue;
    }

    public ENTravelSheetFuelTypeRef getTravelSheetFuelTypeRef(){
       return travelSheetFuelTypeRef;
    }

} // end of ENTransportRealFuelRemainsValueObject


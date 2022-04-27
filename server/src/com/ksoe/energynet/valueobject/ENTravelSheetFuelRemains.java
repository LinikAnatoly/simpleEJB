
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2022 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTravelSheetFuelRemains;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENTravelSheetRef;
    import  com.ksoe.techcard.valueobject.references.TKFuelTypeRef;
    import  com.ksoe.techcard.valueobject.TKTransportReal;
    import  com.ksoe.energynet.valueobject.references.ENTravelSheetFuelTypeRef;

public class ENTravelSheetFuelRemains implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE;
    public Date dateGen;
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
    public Boolean  isThirdParty = null;
    public long  modify_time = Long.MIN_VALUE;

    public ENTravelSheetRef travelSheetRef = new ENTravelSheetRef();
    public TKFuelTypeRef fuelTypeRef = new TKFuelTypeRef();
    public TKTransportReal realTransport = new TKTransportReal();
    public ENTravelSheetFuelTypeRef travelSheetFuelTypeRef = new ENTravelSheetFuelTypeRef();

    public static final String tableName = "ENTRAVELSHEETFUELREMNS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTRAVELSHEETFUELREMNS.CODE";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENTRAVELSHEETFUELREMNS.DATEGEN";
    public static final String countGenStart_Attr = "countGenStart";
    public static final String countGenStart_Field = "COUNTGENSTART";
    public static final String countGenStart_QFielld = "ENTRAVELSHEETFUELREMNS.COUNTGENSTART";
    public static final String priceGenStart_Attr = "priceGenStart";
    public static final String priceGenStart_Field = "PRICEGENSTART";
    public static final String priceGenStart_QFielld = "ENTRAVELSHEETFUELREMNS.PRICEGENSTART";
    public static final String sumGenStart_Attr = "sumGenStart";
    public static final String sumGenStart_Field = "SUMGENSTART";
    public static final String sumGenStart_QFielld = "ENTRAVELSHEETFUELREMNS.SUMGENSTART";
    public static final String countGenIn_Attr = "countGenIn";
    public static final String countGenIn_Field = "COUNTGENIN";
    public static final String countGenIn_QFielld = "ENTRAVELSHEETFUELREMNS.COUNTGENIN";
    public static final String priceGenIn_Attr = "priceGenIn";
    public static final String priceGenIn_Field = "PRICEGENIN";
    public static final String priceGenIn_QFielld = "ENTRAVELSHEETFUELREMNS.PRICEGENIN";
    public static final String sumGenIn_Attr = "sumGenIn";
    public static final String sumGenIn_Field = "SUMGENIN";
    public static final String sumGenIn_QFielld = "ENTRAVELSHEETFUELREMNS.SUMGENIN";
    public static final String countGenOut_Attr = "countGenOut";
    public static final String countGenOut_Field = "COUNTGENOUT";
    public static final String countGenOut_QFielld = "ENTRAVELSHEETFUELREMNS.COUNTGENOUT";
    public static final String priceGenOut_Attr = "priceGenOut";
    public static final String priceGenOut_Field = "PRICEGENOUT";
    public static final String priceGenOut_QFielld = "ENTRAVELSHEETFUELREMNS.PRICEGENOUT";
    public static final String sumGenOut_Attr = "sumGenOut";
    public static final String sumGenOut_Field = "SUMGENOUT";
    public static final String sumGenOut_QFielld = "ENTRAVELSHEETFUELREMNS.SUMGENOUT";
    public static final String countGenFinal_Attr = "countGenFinal";
    public static final String countGenFinal_Field = "COUNTGENFINAL";
    public static final String countGenFinal_QFielld = "ENTRAVELSHEETFUELREMNS.COUNTGENFINAL";
    public static final String priceGenFinal_Attr = "priceGenFinal";
    public static final String priceGenFinal_Field = "PRICEGENFINAL";
    public static final String priceGenFinal_QFielld = "ENTRAVELSHEETFUELREMNS.PRICEGENFINAL";
    public static final String sumGenFinal_Attr = "sumGenFinal";
    public static final String sumGenFinal_Field = "SUMGENFINAL";
    public static final String sumGenFinal_QFielld = "ENTRAVELSHEETFUELREMNS.SUMGENFINAL";
    public static final String isThirdParty_Attr = "isThirdParty";
    public static final String isThirdParty_Field = "ISTHIRDPARTY";
    public static final String isThirdParty_QFielld = "ENTRAVELSHEETFUELREMNS.ISTHIRDPARTY";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENTRAVELSHEETFUELREMNS.MODIFY_TIME";

    public static final String travelSheetRef_Attr = "travelSheetRef";
    public static final String travelSheetRef_Field = "TRAVELSHEETREFCODE";
    public static final String  travelSheetRef_QFielld = "ENTRAVELSHEETFUELREMNS.TRAVELSHEETREFCODE";
    public static final String fuelTypeRef_Attr = "fuelTypeRef";
    public static final String fuelTypeRef_Field = "FUELTYPEREFCODE";
    public static final String  fuelTypeRef_QFielld = "ENTRAVELSHEETFUELREMNS.FUELTYPEREFCODE";
    public static final String realTransport_Attr = "realTransport";
    public static final String realTransport_Field = "REALTRANSPORTCODE";
    public static final String  realTransport_QFielld = "ENTRAVELSHEETFUELREMNS.REALTRANSPORTCODE";
    public static final String travelSheetFuelTypeRef_Attr = "travelSheetFuelTypeRef";
    public static final String travelSheetFuelTypeRef_Field = "TRAVELSHEETFUELTYPRFCD";
    public static final String  travelSheetFuelTypeRef_QFielld = "ENTRAVELSHEETFUELREMNS.TRAVELSHEETFUELTYPRFCD";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public Date getDateGen(){
       return dateGen;
    }

    public void setDateGen(Date dateGen){
       this.dateGen = dateGen;
    }


    public BigDecimal getCountGenStart(){
       return countGenStart;
    }
    
    public void setCountGenStart(BigDecimal countGenStart){
       this.countGenStart = countGenStart;
    }


    public BigDecimal getPriceGenStart(){
       return priceGenStart;
    }
    
    public void setPriceGenStart(BigDecimal priceGenStart){
       this.priceGenStart = priceGenStart;
    }


    public BigDecimal getSumGenStart(){
       return sumGenStart;
    }
    
    public void setSumGenStart(BigDecimal sumGenStart){
       this.sumGenStart = sumGenStart;
    }


    public BigDecimal getCountGenIn(){
       return countGenIn;
    }
    
    public void setCountGenIn(BigDecimal countGenIn){
       this.countGenIn = countGenIn;
    }


    public BigDecimal getPriceGenIn(){
       return priceGenIn;
    }
    
    public void setPriceGenIn(BigDecimal priceGenIn){
       this.priceGenIn = priceGenIn;
    }


    public BigDecimal getSumGenIn(){
       return sumGenIn;
    }
    
    public void setSumGenIn(BigDecimal sumGenIn){
       this.sumGenIn = sumGenIn;
    }


    public BigDecimal getCountGenOut(){
       return countGenOut;
    }
    
    public void setCountGenOut(BigDecimal countGenOut){
       this.countGenOut = countGenOut;
    }


    public BigDecimal getPriceGenOut(){
       return priceGenOut;
    }
    
    public void setPriceGenOut(BigDecimal priceGenOut){
       this.priceGenOut = priceGenOut;
    }


    public BigDecimal getSumGenOut(){
       return sumGenOut;
    }
    
    public void setSumGenOut(BigDecimal sumGenOut){
       this.sumGenOut = sumGenOut;
    }


    public BigDecimal getCountGenFinal(){
       return countGenFinal;
    }
    
    public void setCountGenFinal(BigDecimal countGenFinal){
       this.countGenFinal = countGenFinal;
    }


    public BigDecimal getPriceGenFinal(){
       return priceGenFinal;
    }
    
    public void setPriceGenFinal(BigDecimal priceGenFinal){
       this.priceGenFinal = priceGenFinal;
    }


    public BigDecimal getSumGenFinal(){
       return sumGenFinal;
    }
    
    public void setSumGenFinal(BigDecimal sumGenFinal){
       this.sumGenFinal = sumGenFinal;
    }


    public Boolean getIsThirdParty(){
       return isThirdParty;
    }
    
    public boolean checkIsThirdParty() {
    	return this.isThirdParty != null && this.isThirdParty;
    }

    public void setIsThirdParty(Boolean isThirdParty){
       this.isThirdParty = isThirdParty;
    }


    public long getModify_time(){
       return modify_time;
    }
    
    public void setModify_time(long modify_time){
       this.modify_time = modify_time;
    }

    public ENTravelSheetRef getTravelSheetRef(){
       return travelSheetRef;
    }
    
    public void setTravelSheetRef(ENTravelSheetRef travelSheetRef){
       this.travelSheetRef = travelSheetRef;
    }
    public TKFuelTypeRef getFuelTypeRef(){
       return fuelTypeRef;
    }
    
    public void setFuelTypeRef(TKFuelTypeRef fuelTypeRef){
       this.fuelTypeRef = fuelTypeRef;
    }
    public TKTransportReal getRealTransport(){
       return realTransport;
    }
    
    public void setRealTransport(TKTransportReal realTransport){
       this.realTransport = realTransport;
    }
    public ENTravelSheetFuelTypeRef getTravelSheetFuelTypeRef(){
       return travelSheetFuelTypeRef;
    }
    
    public void setTravelSheetFuelTypeRef(ENTravelSheetFuelTypeRef travelSheetFuelTypeRef){
       this.travelSheetFuelTypeRef = travelSheetFuelTypeRef;
    }

} // end of ENTravelSheetFuelRemainsValueObject


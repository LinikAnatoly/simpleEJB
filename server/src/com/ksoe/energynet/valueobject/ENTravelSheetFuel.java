
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2022 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTravelSheetFuel;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENTravelSheetRef;
    import  com.ksoe.techcard.valueobject.TKTransportReal;
    import  com.ksoe.techcard.valueobject.TKFuelType;
    import  com.ksoe.energynet.valueobject.references.ENTravelSheetFuelTypeRef;

public class ENTravelSheetFuel implements Serializable {

private static final long serialVersionUID = 1L;

    public int  code = Integer.MIN_VALUE;
    public BigDecimal  countGen; 
    public String  series; 
    public String  numbers; 
    public Date dateGen;
    public int  isVRTU = Integer.MIN_VALUE;
    public Boolean  isThirdParty = null;
    public long  modify_time = Long.MIN_VALUE;

    public ENTravelSheetRef travelSheetRef = new ENTravelSheetRef();
    public TKTransportReal realTransport = new TKTransportReal();
    public TKFuelType fuelType = new TKFuelType();
    public ENTravelSheetFuelTypeRef travelSheetFuelTypeRef = new ENTravelSheetFuelTypeRef();

    public static final String tableName = "ENTRAVELSHEETFUEL";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTRAVELSHEETFUEL.CODE";
    public static final String countGen_Attr = "countGen";
    public static final String countGen_Field = "COUNTGEN";
    public static final String countGen_QFielld = "ENTRAVELSHEETFUEL.COUNTGEN";
    public static final String series_Attr = "series";
    public static final String series_Field = "SERIES";
    public static final String series_QFielld = "ENTRAVELSHEETFUEL.SERIES";
    public static final String numbers_Attr = "numbers";
    public static final String numbers_Field = "NUMBERS";
    public static final String numbers_QFielld = "ENTRAVELSHEETFUEL.NUMBERS";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENTRAVELSHEETFUEL.DATEGEN";
    public static final String isVRTU_Attr = "isVRTU";
    public static final String isVRTU_Field = "ISVRTU";
    public static final String isVRTU_QFielld = "ENTRAVELSHEETFUEL.ISVRTU";
    public static final String isThirdParty_Attr = "isThirdParty";
    public static final String isThirdParty_Field = "ISTHIRDPARTY";
    public static final String isThirdParty_QFielld = "ENTRAVELSHEETFUEL.ISTHIRDPARTY";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENTRAVELSHEETFUEL.MODIFY_TIME";

    public static final String travelSheetRef_Attr = "travelSheetRef";
    public static final String travelSheetRef_Field = "TRAVELSHEETREFCODE";
    public static final String  travelSheetRef_QFielld = "ENTRAVELSHEETFUEL.TRAVELSHEETREFCODE";
    public static final String realTransport_Attr = "realTransport";
    public static final String realTransport_Field = "REALTRANSPORTCODE";
    public static final String  realTransport_QFielld = "ENTRAVELSHEETFUEL.REALTRANSPORTCODE";
    public static final String fuelType_Attr = "fuelType";
    public static final String fuelType_Field = "FUELTYPECODE";
    public static final String  fuelType_QFielld = "ENTRAVELSHEETFUEL.FUELTYPECODE";
    public static final String travelSheetFuelTypeRef_Attr = "travelSheetFuelTypeRef";
    public static final String travelSheetFuelTypeRef_Field = "TRAVELSHEETFUELTYPRFCD";
    public static final String  travelSheetFuelTypeRef_QFielld = "ENTRAVELSHEETFUEL.TRAVELSHEETFUELTYPRFCD";



    public int getCode(){
       return code;
    }
    
    public void setCode(int code){
       this.code = code;
    }


    public BigDecimal getCountGen(){
       return countGen;
    }
    
    public void setCountGen(BigDecimal countGen){
       this.countGen = countGen;
    }


    public String getSeries(){
       return series;
    }
    
    public void setSeries(String series){
       this.series = series;
    }


    public String getNumbers(){
       return numbers;
    }
    
    public void setNumbers(String numbers){
       this.numbers = numbers;
    }


    public Date getDateGen(){
       return dateGen;
    }

    public void setDateGen(Date dateGen){
       this.dateGen = dateGen;
    }


    public int getIsVRTU(){
       return isVRTU;
    }
    
    public void setIsVRTU(int isVRTU){
       this.isVRTU = isVRTU;
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
    public TKTransportReal getRealTransport(){
       return realTransport;
    }
    
    public void setRealTransport(TKTransportReal realTransport){
       this.realTransport = realTransport;
    }
    public TKFuelType getFuelType(){
       return fuelType;
    }
    
    public void setFuelType(TKFuelType fuelType){
       this.fuelType = fuelType;
    }
    public ENTravelSheetFuelTypeRef getTravelSheetFuelTypeRef(){
       return travelSheetFuelTypeRef;
    }
    
    public void setTravelSheetFuelTypeRef(ENTravelSheetFuelTypeRef travelSheetFuelTypeRef){
       this.travelSheetFuelTypeRef = travelSheetFuelTypeRef;
    }

} // end of ENTravelSheetFuelValueObject


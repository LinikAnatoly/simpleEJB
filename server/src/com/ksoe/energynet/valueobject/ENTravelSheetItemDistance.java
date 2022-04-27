
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTravelSheetItemDistance;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENTravelSheetItemRef;

public class ENTravelSheetItemDistance implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  distance; 
    public BigDecimal  sumMachineHours; 
    public BigDecimal  koef; 
    public ENTravelSheetItemRef travelSheetItemRef = new ENTravelSheetItemRef();
    public static final String tableName = "ENTRAVELSHEETITEMDSTNC";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTRAVELSHEETITEMDSTNC.CODE";
    public static final String distance_Attr = "distance";
    public static final String distance_Field = "DISTANCE";
    public static final String distance_QFielld = "ENTRAVELSHEETITEMDSTNC.DISTANCE";
    public static final String sumMachineHours_Attr = "sumMachineHours";
    public static final String sumMachineHours_Field = "SUMMACHINEHOURS";
    public static final String sumMachineHours_QFielld = "ENTRAVELSHEETITEMDSTNC.SUMMACHINEHOURS";
    public static final String koef_Attr = "koef";
    public static final String koef_Field = "KOEF";
    public static final String koef_QFielld = "ENTRAVELSHEETITEMDSTNC.KOEF";
    public static final String travelSheetItemRef_Attr = "travelSheetItemRef";
    public static final String travelSheetItemRef_Field = "TRAVELSHEETITEMREFCODE";
    public static final String  travelSheetItemRef_QFielld = "ENTRAVELSHEETITEMDSTNC.TRAVELSHEETITEMREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setDistance(BigDecimal aValue){
       distance = aValue;
    }

    public BigDecimal getDistance(){
       return distance;
    }

    public void setSumMachineHours(BigDecimal aValue){
       sumMachineHours = aValue;
    }

    public BigDecimal getSumMachineHours(){
       return sumMachineHours;
    }

    public void setKoef(BigDecimal aValue){
       koef = aValue;
    }

    public BigDecimal getKoef(){
       return koef;
    }

    public void setTravelSheetItemRef(ENTravelSheetItemRef aValue){
       travelSheetItemRef = aValue;
    }

    public ENTravelSheetItemRef getTravelSheetItemRef(){
       return travelSheetItemRef;
    }

} // end of ENTravelSheetItemDistanceValueObject


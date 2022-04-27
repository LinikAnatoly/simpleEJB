
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTravelSheetItemDistance2TKFuelKoef;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENTravelSheetItemDistanceRef;
    import  com.ksoe.techcard.valueobject.references.TKFuelKoefRef;

public class ENTravelSheetItemDistance2TKFuelKoef implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public ENTravelSheetItemDistanceRef travelSheetItemDistanceRef = new ENTravelSheetItemDistanceRef();
    public TKFuelKoefRef tkFuelKoefRef = new TKFuelKoefRef();
    public static final String tableName = "NTRVLSHTTMDSTNC2TKFLKF";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "NTRVLSHTTMDSTNC2TKFLKF.CODE";
    public static final String travelSheetItemDistanceRef_Attr = "travelSheetItemDistanceRef";
    public static final String travelSheetItemDistanceRef_Field = "TRAVELSHEETTMDSTNCRFCD";
    public static final String  travelSheetItemDistanceRef_QFielld = "NTRVLSHTTMDSTNC2TKFLKF.TRAVELSHEETTMDSTNCRFCD";
    public static final String tkFuelKoefRef_Attr = "tkFuelKoefRef";
    public static final String tkFuelKoefRef_Field = "TKFUELKOEFREFCODE";
    public static final String  tkFuelKoefRef_QFielld = "NTRVLSHTTMDSTNC2TKFLKF.TKFUELKOEFREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setTravelSheetItemDistanceRef(ENTravelSheetItemDistanceRef aValue){
       travelSheetItemDistanceRef = aValue;
    }

    public ENTravelSheetItemDistanceRef getTravelSheetItemDistanceRef(){
       return travelSheetItemDistanceRef;
    }
    public void setTkFuelKoefRef(TKFuelKoefRef aValue){
       tkFuelKoefRef = aValue;
    }

    public TKFuelKoefRef getTkFuelKoefRef(){
       return tkFuelKoefRef;
    }

} // end of ENTravelSheetItemDistance2TKFuelKoefValueObject


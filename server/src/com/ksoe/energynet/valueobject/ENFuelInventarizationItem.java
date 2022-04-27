
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENFuelInventarizationItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENFuelInventarizationRef;
    import  com.ksoe.techcard.valueobject.references.TKFuelTypeRef;
    import  com.ksoe.techcard.valueobject.references.TKTransportRealRef;
    import  com.ksoe.energynet.valueobject.references.ENTravelSheetRef;
    import  com.ksoe.energynet.valueobject.references.ENTravelSheetFuelTypeRef;

public class ENFuelInventarizationItem implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public BigDecimal  countGen; 
    public BigDecimal  countFact; 
    public String  userAdd; 
    public Date dateAdd ;
    public String  userGen; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public ENFuelInventarizationRef inventarizationRef = new ENFuelInventarizationRef();
    public TKFuelTypeRef fuelTypeRef = new TKFuelTypeRef();
    public TKTransportRealRef transportRealRef = new TKTransportRealRef();
    public ENTravelSheetRef travelSheetRef = new ENTravelSheetRef();
    public ENTravelSheetFuelTypeRef travelFuelTypeRef = new ENTravelSheetFuelTypeRef();
    public static final String tableName = "ENFUELINVENTARIZATINTM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENFUELINVENTARIZATINTM.CODE";
    public static final String countGen_Attr = "countGen";
    public static final String countGen_Field = "COUNTGEN";
    public static final String countGen_QFielld = "ENFUELINVENTARIZATINTM.COUNTGEN";
    public static final String countFact_Attr = "countFact";
    public static final String countFact_Field = "COUNTFACT";
    public static final String countFact_QFielld = "ENFUELINVENTARIZATINTM.COUNTFACT";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "ENFUELINVENTARIZATINTM.USERADD";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENFUELINVENTARIZATINTM.DATEADD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENFUELINVENTARIZATINTM.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENFUELINVENTARIZATINTM.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENFUELINVENTARIZATINTM.MODIFY_TIME";
    public static final String inventarizationRef_Attr = "inventarizationRef";
    public static final String inventarizationRef_Field = "INVENTARIZATIONREFCODE";
    public static final String  inventarizationRef_QFielld = "ENFUELINVENTARIZATINTM.INVENTARIZATIONREFCODE";
    public static final String fuelTypeRef_Attr = "fuelTypeRef";
    public static final String fuelTypeRef_Field = "FUELTYPEREFCODE";
    public static final String  fuelTypeRef_QFielld = "ENFUELINVENTARIZATINTM.FUELTYPEREFCODE";
    public static final String transportRealRef_Attr = "transportRealRef";
    public static final String transportRealRef_Field = "TRANSPORTREALREFCODE";
    public static final String  transportRealRef_QFielld = "ENFUELINVENTARIZATINTM.TRANSPORTREALREFCODE";
    public static final String travelSheetRef_Attr = "travelSheetRef";
    public static final String travelSheetRef_Field = "TRAVELSHEETREFCODE";
    public static final String  travelSheetRef_QFielld = "ENFUELINVENTARIZATINTM.TRAVELSHEETREFCODE";
    public static final String travelFuelTypeRef_Attr = "travelFuelTypeRef";
    public static final String travelFuelTypeRef_Field = "TRAVELFUELTYPEREFCODE";
    public static final String  travelFuelTypeRef_QFielld = "ENFUELINVENTARIZATINTM.TRAVELFUELTYPEREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setCountGen(BigDecimal aValue){
       countGen = aValue;
    }

    public BigDecimal getCountGen(){
       return countGen;
    }

    public void setCountFact(BigDecimal aValue){
       countFact = aValue;
    }

    public BigDecimal getCountFact(){
       return countFact;
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

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setInventarizationRef(ENFuelInventarizationRef aValue){
       inventarizationRef = aValue;
    }

    public ENFuelInventarizationRef getInventarizationRef(){
       return inventarizationRef;
    }
    public void setFuelTypeRef(TKFuelTypeRef aValue){
       fuelTypeRef = aValue;
    }

    public TKFuelTypeRef getFuelTypeRef(){
       return fuelTypeRef;
    }
    public void setTransportRealRef(TKTransportRealRef aValue){
       transportRealRef = aValue;
    }

    public TKTransportRealRef getTransportRealRef(){
       return transportRealRef;
    }
    public void setTravelSheetRef(ENTravelSheetRef aValue){
       travelSheetRef = aValue;
    }

    public ENTravelSheetRef getTravelSheetRef(){
       return travelSheetRef;
    }
    public void setTravelFuelTypeRef(ENTravelSheetFuelTypeRef aValue){
       travelFuelTypeRef = aValue;
    }

    public ENTravelSheetFuelTypeRef getTravelFuelTypeRef(){
       return travelFuelTypeRef;
    }

} // end of ENFuelInventarizationItemValueObject


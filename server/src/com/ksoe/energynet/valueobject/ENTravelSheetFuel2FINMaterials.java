
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENTravelSheetFuel2FINMaterials;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENTravelSheetFuelRef;
    import  com.ksoe.energynet.valueobject.references.FINMaterialsRef;

public class ENTravelSheetFuel2FINMaterials implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public long  modify_time = Long.MIN_VALUE;
    public String  userGen; 
    public Date dateEdit ;
    public ENTravelSheetFuelRef travelSheetFuelRef = new ENTravelSheetFuelRef();
    public FINMaterialsRef finMaterialsRef = new FINMaterialsRef();
    public static final String tableName = "ENTRAVELSHETFL2FNMTRLS";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENTRAVELSHETFL2FNMTRLS.CODE";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENTRAVELSHETFL2FNMTRLS.MODIFY_TIME";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENTRAVELSHETFL2FNMTRLS.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENTRAVELSHETFL2FNMTRLS.DATEEDIT";
    public static final String travelSheetFuelRef_Attr = "travelSheetFuelRef";
    public static final String travelSheetFuelRef_Field = "TRAVELSHEETFUELREFCODE";
    public static final String  travelSheetFuelRef_QFielld = "ENTRAVELSHETFL2FNMTRLS.TRAVELSHEETFUELREFCODE";
    public static final String finMaterialsRef_Attr = "finMaterialsRef";
    public static final String finMaterialsRef_Field = "FINMATERIALSREFCODE";
    public static final String  finMaterialsRef_QFielld = "ENTRAVELSHETFL2FNMTRLS.FINMATERIALSREFCODE";


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

    public void setTravelSheetFuelRef(ENTravelSheetFuelRef aValue){
       travelSheetFuelRef = aValue;
    }

    public ENTravelSheetFuelRef getTravelSheetFuelRef(){
       return travelSheetFuelRef;
    }
    public void setFinMaterialsRef(FINMaterialsRef aValue){
       finMaterialsRef = aValue;
    }

    public FINMaterialsRef getFinMaterialsRef(){
       return finMaterialsRef;
    }

} // end of ENTravelSheetFuel2FINMaterialsValueObject


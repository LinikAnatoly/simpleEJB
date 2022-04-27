
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENFuelSheetVolumes;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENFuelSheetVolumesStatusRef;

public class ENFuelSheetVolumes implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public Date dateGen ;
    public Date startDate ;
    public Date endDate ;
    public int  fuelType = Integer.MIN_VALUE; 
    public String  userAdd; 
    public Date dateAdd ;
    public String  userGen; 
    public Date dateEdit ;
    public long  modify_time = Long.MIN_VALUE;
    public ENFuelSheetVolumesStatusRef statusRef = new ENFuelSheetVolumesStatusRef();
    public static final String tableName = "ENFUELSHEETVOLUMES";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENFUELSHEETVOLUMES.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENFUELSHEETVOLUMES.NAME";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENFUELSHEETVOLUMES.DATEGEN";
    public static final String startDate_Attr = "startDate";
    public static final String startDate_Field = "STARTDATE";
    public static final String startDate_QFielld = "ENFUELSHEETVOLUMES.STARTDATE";
    public static final String endDate_Attr = "endDate";
    public static final String endDate_Field = "ENDDATE";
    public static final String endDate_QFielld = "ENFUELSHEETVOLUMES.ENDDATE";
    public static final String fuelType_Attr = "fuelType";
    public static final String fuelType_Field = "FUELTYPE";
    public static final String fuelType_QFielld = "ENFUELSHEETVOLUMES.FUELTYPE";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "ENFUELSHEETVOLUMES.USERADD";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENFUELSHEETVOLUMES.DATEADD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENFUELSHEETVOLUMES.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENFUELSHEETVOLUMES.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENFUELSHEETVOLUMES.MODIFY_TIME";
    public static final String statusRef_Attr = "statusRef";
    public static final String statusRef_Field = "STATUSREFCODE";
    public static final String  statusRef_QFielld = "ENFUELSHEETVOLUMES.STATUSREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }


    public void setDateGen(Date aValue){
       dateGen = aValue;
    }

    public Date getDateGen(){
       return dateGen;
    }


    public void setStartDate(Date aValue){
       startDate = aValue;
    }

    public Date getStartDate(){
       return startDate;
    }


    public void setEndDate(Date aValue){
       endDate = aValue;
    }

    public Date getEndDate(){
       return endDate;
    }

    public void setFuelType(int aValue){
       fuelType = aValue;
    }

    public int getFuelType(){
       return fuelType;
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

    public void setStatusRef(ENFuelSheetVolumesStatusRef aValue){
       statusRef = aValue;
    }

    public ENFuelSheetVolumesStatusRef getStatusRef(){
       return statusRef;
    }

} // end of ENFuelSheetVolumesValueObject


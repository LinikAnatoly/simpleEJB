
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPlanWorkFuelHistory;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENPlanWorkRef;
    import  com.ksoe.techcard.valueobject.references.TKFuelTypeRef;

public class ENPlanWorkFuelHistory implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public Date dateGen ;
    public BigDecimal  countGen; 
    public int  version = Integer.MIN_VALUE; 
    public long  modify_time = Long.MIN_VALUE;
    public String  userAdd; 
    public Date dateAdd ;
    public String  userGen; 
    public Date dateEdit ;
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public TKFuelTypeRef fuelTypeRef = new TKFuelTypeRef();
    public static final String tableName = "ENPLANWORKFUELHISTORY";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPLANWORKFUELHISTORY.CODE";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENPLANWORKFUELHISTORY.DATEGEN";
    public static final String countGen_Attr = "countGen";
    public static final String countGen_Field = "COUNTGEN";
    public static final String countGen_QFielld = "ENPLANWORKFUELHISTORY.COUNTGEN";
    public static final String version_Attr = "version";
    public static final String version_Field = "VERSION";
    public static final String version_QFielld = "ENPLANWORKFUELHISTORY.VERSION";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENPLANWORKFUELHISTORY.MODIFY_TIME";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "ENPLANWORKFUELHISTORY.USERADD";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENPLANWORKFUELHISTORY.DATEADD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENPLANWORKFUELHISTORY.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENPLANWORKFUELHISTORY.DATEEDIT";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENPLANWORKFUELHISTORY.PLANREFCODE";
    public static final String fuelTypeRef_Attr = "fuelTypeRef";
    public static final String fuelTypeRef_Field = "FUELTYPEREFCODE";
    public static final String  fuelTypeRef_QFielld = "ENPLANWORKFUELHISTORY.FUELTYPEREFCODE";


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

    public void setCountGen(BigDecimal aValue){
       countGen = aValue;
    }

    public BigDecimal getCountGen(){
       return countGen;
    }

    public void setVersion(int aValue){
       version = aValue;
    }

    public int getVersion(){
       return version;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
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

    public void setPlanRef(ENPlanWorkRef aValue){
       planRef = aValue;
    }

    public ENPlanWorkRef getPlanRef(){
       return planRef;
    }
    public void setFuelTypeRef(TKFuelTypeRef aValue){
       fuelTypeRef = aValue;
    }

    public TKFuelTypeRef getFuelTypeRef(){
       return fuelTypeRef;
    }

} // end of ENPlanWorkFuelHistoryValueObject


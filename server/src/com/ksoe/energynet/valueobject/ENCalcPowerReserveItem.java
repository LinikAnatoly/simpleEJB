
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENCalcPowerReserveItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENCalcPowerReserveRef;
    import  com.ksoe.energynet.valueobject.references.ENSO2NodeRef;

public class ENCalcPowerReserveItem implements Serializable {

    public int  code = Integer.MIN_VALUE;
    public long  modify_time = Long.MIN_VALUE;
    public String  userAdd; 
    public Date dateAdd ;
    public String  userGen; 
    public Date dateEdit ;
    public ENCalcPowerReserveRef calcPowerReserveRef = new ENCalcPowerReserveRef();
    public ENSO2NodeRef so2nodeRef = new ENSO2NodeRef();
    public static final String tableName = "ENCALCPOWERRESERVEITEM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENCALCPOWERRESERVEITEM.CODE";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENCALCPOWERRESERVEITEM.MODIFY_TIME";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "ENCALCPOWERRESERVEITEM.USERADD";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENCALCPOWERRESERVEITEM.DATEADD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENCALCPOWERRESERVEITEM.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENCALCPOWERRESERVEITEM.DATEEDIT";
    public static final String calcPowerReserveRef_Attr = "calcPowerReserveRef";
    public static final String calcPowerReserveRef_Field = "CALCPOWERRESERVEREFCOD";
    public static final String  calcPowerReserveRef_QFielld = "ENCALCPOWERRESERVEITEM.CALCPOWERRESERVEREFCOD";
    public static final String so2nodeRef_Attr = "so2nodeRef";
    public static final String so2nodeRef_Field = "SO2NODEREFCODE";
    public static final String  so2nodeRef_QFielld = "ENCALCPOWERRESERVEITEM.SO2NODEREFCODE";



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

    public void setCalcPowerReserveRef(ENCalcPowerReserveRef aValue){
       calcPowerReserveRef = aValue;
    }

    public ENCalcPowerReserveRef getCalcPowerReserveRef(){
       return calcPowerReserveRef;
    }
    public void setSo2nodeRef(ENSO2NodeRef aValue){
       so2nodeRef = aValue;
    }

    public ENSO2NodeRef getSo2nodeRef(){
       return so2nodeRef;
    }

} // end of ENCalcPowerReserveItemValueObject



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENIPItem2ENIPItem;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENIPItemRef;
    import  com.ksoe.energynet.valueobject.references.ENIPItemRef;

public class ENIPItem2ENIPItem implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public long  modify_time = Long.MIN_VALUE;
    public String  userAdd; 
    public Date dateAdd ;
    public String  userGen; 
    public Date dateEdit ;
    public ENIPItemRef ipItemInRef = new ENIPItemRef();
    public ENIPItemRef ipItemOutRef = new ENIPItemRef();
    public static final String tableName = "ENIPITEM2ENIPITEM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENIPITEM2ENIPITEM.CODE";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENIPITEM2ENIPITEM.MODIFY_TIME";
    public static final String userAdd_Attr = "userAdd";
    public static final String userAdd_Field = "USERADD";
    public static final String userAdd_QFielld = "ENIPITEM2ENIPITEM.USERADD";
    public static final String dateAdd_Attr = "dateAdd";
    public static final String dateAdd_Field = "DATEADD";
    public static final String dateAdd_QFielld = "ENIPITEM2ENIPITEM.DATEADD";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENIPITEM2ENIPITEM.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENIPITEM2ENIPITEM.DATEEDIT";
    public static final String ipItemInRef_Attr = "ipItemInRef";
    public static final String ipItemInRef_Field = "IPITEMINREFCODE";
    public static final String  ipItemInRef_QFielld = "ENIPITEM2ENIPITEM.IPITEMINREFCODE";
    public static final String ipItemOutRef_Attr = "ipItemOutRef";
    public static final String ipItemOutRef_Field = "IPITEMOUTREFCODE";
    public static final String  ipItemOutRef_QFielld = "ENIPITEM2ENIPITEM.IPITEMOUTREFCODE";


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

    public void setIpItemInRef(ENIPItemRef aValue){
       ipItemInRef = aValue;
    }

    public ENIPItemRef getIpItemInRef(){
       return ipItemInRef;
    }
    public void setIpItemOutRef(ENIPItemRef aValue){
       ipItemOutRef = aValue;
    }

    public ENIPItemRef getIpItemOutRef(){
       return ipItemOutRef;
    }

} // end of ENIPItem2ENIPItemValueObject


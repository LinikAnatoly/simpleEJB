
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENDestinationPoint;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;

    import  com.ksoe.energynet.valueobject.references.ENElementRef;
    import  com.ksoe.energynet.valueobject.references.ENDepartmentRef;

public class ENDestinationPoint implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public String  commentGen; 
    public Date dateEdit ;
    public String  userGen; 
    public long  modify_time = Long.MIN_VALUE;
    public ENElementRef elementRef = new ENElementRef();
    public ENDepartmentRef departmentRef = new ENDepartmentRef();
    public static final String tableName = "ENDESTINATIONPOINT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENDESTINATIONPOINT.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENDESTINATIONPOINT.NAME";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENDESTINATIONPOINT.COMMENTGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENDESTINATIONPOINT.DATEEDIT";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENDESTINATIONPOINT.USERGEN";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENDESTINATIONPOINT.MODIFY_TIME";
    public static final String elementRef_Attr = "elementRef";
    public static final String elementRef_Field = "ELEMENTREFCODE";
    public static final String  elementRef_QFielld = "ENDESTINATIONPOINT.ELEMENTREFCODE";
    public static final String departmentRef_Attr = "departmentRef";
    public static final String departmentRef_Field = "DEPARTMENTREFCODE";
    public static final String  departmentRef_QFielld = "ENDESTINATIONPOINT.DEPARTMENTREFCODE";


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

    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
    }


    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }

    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setElementRef(ENElementRef aValue){
       elementRef = aValue;
    }

    public ENElementRef getElementRef(){
       return elementRef;
    }
    public void setDepartmentRef(ENDepartmentRef aValue){
       departmentRef = aValue;
    }

    public ENDepartmentRef getDepartmentRef(){
       return departmentRef;
    }

} // end of ENDestinationPointValueObject


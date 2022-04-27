
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENBindingOverENBindingOver;  	
  */

import java.io.Serializable;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.ENPlanWorkRef;

public class ENBindingOver implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  numberGen; 
    public Date  dateGen; 
    public String  itemText; 
    public String  commentGen; 
    public String  userGen; 
    public Date  dateEdit; 
    public long  modify_time = Long.MIN_VALUE;
    public ENBindingOverOrganization organization = new ENBindingOverOrganization();
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public static final String tableName = "ENBINDINGOVER";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENBINDINGOVER.CODE";
    public static final String numberGen_Attr = "numberGen";
    public static final String numberGen_Field = "NUMBERGEN";
    public static final String numberGen_QFielld = "ENBINDINGOVER.NUMBERGEN";
    public static final String dateGen_Attr = "dateGen";
    public static final String dateGen_Field = "DATEGEN";
    public static final String dateGen_QFielld = "ENBINDINGOVER.DATEGEN";
    public static final String itemText_Attr = "itemText";
    public static final String itemText_Field = "ITEMTEXT";
    public static final String itemText_QFielld = "ENBINDINGOVER.ITEMTEXT";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENBINDINGOVER.COMMENTGEN";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "ENBINDINGOVER.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "ENBINDINGOVER.DATEEDIT";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENBINDINGOVER.MODIFY_TIME";
    public static final String organization_Attr = "organization";
    public static final String organization_Field = "ORGANIZATIONCODE";
    public static final String  organization_QFielld = "ENBINDINGOVER.ORGANIZATIONCODE";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "ENBINDINGOVER.PLANREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setNumberGen(String aValue){
       numberGen = aValue;
    }

    public String getNumberGen(){
       return numberGen;
    }

    public void setDateGen(Date aValue){
       dateGen = aValue;
    }

    public Date getDateGen(){
       return dateGen;
    }

    public void setItemText(String aValue){
       itemText = aValue;
    }

    public String getItemText(){
       return itemText;
    }

    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
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

;
    public void setOrganization(ENBindingOverOrganization aValue){
       organization = aValue;
    }

    public ENBindingOverOrganization getOrganization(){
       return organization;
    }
    public void setPlanRef(ENPlanWorkRef aValue){
       planRef = aValue;
    }

    public ENPlanWorkRef getPlanRef(){
       return planRef;
    }

} // end of ENBindingOverValueObject


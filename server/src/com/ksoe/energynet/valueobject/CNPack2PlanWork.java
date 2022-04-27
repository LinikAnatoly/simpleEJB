
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for CNPack2PlanWorkCNPack2PlanWork;  	
  */

import java.io.Serializable;
import java.util.Date;

import com.ksoe.energynet.valueobject.references.CNSubsystemTypeRef;
import com.ksoe.energynet.valueobject.references.ENPlanWorkRef;

public class CNPack2PlanWork implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public int  packCode = Integer.MIN_VALUE; 
    public String  commentGen; 
    public String  userGen; 
    public Date  dateEdit; 
    public String  domain_info; 
    public long  modify_time = Long.MIN_VALUE;
    public CNSubsystemTypeRef packTypeRef = new CNSubsystemTypeRef();
    public ENPlanWorkRef planRef = new ENPlanWorkRef();
    public static final String tableName = "CNPACK2PLANWORK";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "CNPACK2PLANWORK.CODE";
    public static final String packCode_Attr = "packCode";
    public static final String packCode_Field = "PACKCODE";
    public static final String packCode_QFielld = "CNPACK2PLANWORK.PACKCODE";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "CNPACK2PLANWORK.COMMENTGEN";
    public static final String userGen_Attr = "userGen";
    public static final String userGen_Field = "USERGEN";
    public static final String userGen_QFielld = "CNPACK2PLANWORK.USERGEN";
    public static final String dateEdit_Attr = "dateEdit";
    public static final String dateEdit_Field = "DATEEDIT";
    public static final String dateEdit_QFielld = "CNPACK2PLANWORK.DATEEDIT";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "CNPACK2PLANWORK.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "CNPACK2PLANWORK.MODIFY_TIME";
    public static final String packTypeRef_Attr = "packTypeRef";
    public static final String packTypeRef_Field = "PACKTYPEREFCODE";
    public static final String  packTypeRef_QFielld = "CNPACK2PLANWORK.PACKTYPEREFCODE";
    public static final String planRef_Attr = "planRef";
    public static final String planRef_Field = "PLANREFCODE";
    public static final String  planRef_QFielld = "CNPACK2PLANWORK.PLANREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setPackCode(int aValue){
       packCode = aValue;
    }

    public int getPackCode(){
       return packCode;
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

    public void setDomain_info(String aValue){
       domain_info = aValue;
    }

    public String getDomain_info(){
       return domain_info;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

;
    public void setPackTypeRef(CNSubsystemTypeRef aValue){
       packTypeRef = aValue;
    }

    public CNSubsystemTypeRef getPackTypeRef(){
       return packTypeRef;
    }
    public void setPlanRef(ENPlanWorkRef aValue){
       planRef = aValue;
    }

    public ENPlanWorkRef getPlanRef(){
       return planRef;
    }

} // end of CNPack2PlanWorkValueObject


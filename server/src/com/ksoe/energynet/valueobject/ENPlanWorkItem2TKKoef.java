
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENPlanWorkItem2TKKoefENPlanWorkItem2TKKoef;  	
  */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.ENPlanWorkItemRef;
import com.ksoe.techcard.valueobject.TKTechCardSourceKoef;

public class ENPlanWorkItem2TKKoef implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  commentGen; 
    public String  domain_info; 
    public long  modify_time = Long.MIN_VALUE;
    public TKTechCardSourceKoef sourceKoef = new TKTechCardSourceKoef();
    public ENPlanWorkItemRef planWorkItemRef = new ENPlanWorkItemRef();
    public static final String tableName = "ENPLANWORKITEM2TKKOEF";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENPLANWORKITEM2TKKOEF.CODE";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENPLANWORKITEM2TKKOEF.COMMENTGEN";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "ENPLANWORKITEM2TKKOEF.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENPLANWORKITEM2TKKOEF.MODIFY_TIME";
    public static final String sourceKoef_Attr = "sourceKoef";
    public static final String sourceKoef_Field = "SOURCEKOEFCODE";
    public static final String  sourceKoef_QFielld = "ENPLANWORKITEM2TKKOEF.SOURCEKOEFCODE";
    public static final String planWorkItemRef_Attr = "planWorkItemRef";
    public static final String planWorkItemRef_Field = "PLANWORKITEMREFCODE";
    public static final String  planWorkItemRef_QFielld = "ENPLANWORKITEM2TKKOEF.PLANWORKITEMREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setCommentGen(String aValue){
       commentGen = aValue;
    }

    public String getCommentGen(){
       return commentGen;
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
    public void setSourceKoef(TKTechCardSourceKoef aValue){
       sourceKoef = aValue;
    }

    public TKTechCardSourceKoef getSourceKoef(){
       return sourceKoef;
    }
    public void setPlanWorkItemRef(ENPlanWorkItemRef aValue){
       planWorkItemRef = aValue;
    }

    public ENPlanWorkItemRef getPlanWorkItemRef(){
       return planWorkItemRef;
    }

} // end of ENPlanWorkItem2TKKoefValueObject


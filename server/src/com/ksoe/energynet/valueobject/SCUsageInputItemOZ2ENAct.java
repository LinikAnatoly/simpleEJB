
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for SCUsageInputItemOZ2ENAct;  	
  */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.ENActRef;
import com.ksoe.energynet.valueobject.references.SCUsageInputItemOZRef;

public class SCUsageInputItemOZ2ENAct implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public long  modify_time = Long.MIN_VALUE;
    public SCUsageInputItemOZRef usageInputItemOZRef = new SCUsageInputItemOZRef();
    public ENActRef enActRef = new ENActRef();
    public static final String tableName = "SCUSAGEINPUTITEMOZ2NCT";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "SCUSAGEINPUTITEMOZ2NCT.CODE";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "SCUSAGEINPUTITEMOZ2NCT.MODIFY_TIME";
    public static final String usageInputItemOZRef_Attr = "usageInputItemOZRef";
    public static final String usageInputItemOZRef_Field = "USAGEINPUTITEMOZREFCOD";
    public static final String  usageInputItemOZRef_QFielld = "SCUSAGEINPUTITEMOZ2NCT.USAGEINPUTITEMOZREFCOD";
    public static final String enActRef_Attr = "enActRef";
    public static final String enActRef_Field = "ENACTREFCODE";
    public static final String  enActRef_QFielld = "SCUSAGEINPUTITEMOZ2NCT.ENACTREFCODE";


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

    public void setUsageInputItemOZRef(SCUsageInputItemOZRef aValue){
       usageInputItemOZRef = aValue;
    }

    public SCUsageInputItemOZRef getUsageInputItemOZRef(){
       return usageInputItemOZRef;
    }
    public void setEnActRef(ENActRef aValue){
       enActRef = aValue;
    }

    public ENActRef getEnActRef(){
       return enActRef;
    }

} // end of SCUsageInputItemOZ2ENActValueObject


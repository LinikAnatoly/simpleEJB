
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for SCUsageInputItemOZ2SCCounter;  	
  */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.SCCounterRef;
import com.ksoe.energynet.valueobject.references.SCUsageInputItemOZRef;

public class SCUsageInputItemOZ2SCCounter implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public long  modify_time = Long.MIN_VALUE;
    public SCUsageInputItemOZRef ozRef = new SCUsageInputItemOZRef();
    public SCCounterRef scCounterRef = new SCCounterRef();
    public static final String tableName = "SCUSAGEINPUTTMZ2SCCNTR";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "SCUSAGEINPUTTMZ2SCCNTR.CODE";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "SCUSAGEINPUTTMZ2SCCNTR.MODIFY_TIME";
    public static final String ozRef_Attr = "ozRef";
    public static final String ozRef_Field = "OZREFCODE";
    public static final String  ozRef_QFielld = "SCUSAGEINPUTTMZ2SCCNTR.OZREFCODE";
    public static final String scCounterRef_Attr = "scCounterRef";
    public static final String scCounterRef_Field = "SCCOUNTERREFCODE";
    public static final String  scCounterRef_QFielld = "SCUSAGEINPUTTMZ2SCCNTR.SCCOUNTERREFCODE";


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

    public void setOzRef(SCUsageInputItemOZRef aValue){
       ozRef = aValue;
    }

    public SCUsageInputItemOZRef getOzRef(){
       return ozRef;
    }
    public void setScCounterRef(SCCounterRef aValue){
       scCounterRef = aValue;
    }

    public SCCounterRef getScCounterRef(){
       return scCounterRef;
    }

} // end of SCUsageInputItemOZ2SCCounterValueObject


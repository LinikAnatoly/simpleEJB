
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for SCUsageInputItem;  	
  */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.SCUsageInputItemKindRef;
import com.ksoe.energynet.valueobject.references.SCUsageInputRef;

public class SCUsageInputItem implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  numberDoc; 
    public int  numberInt = Integer.MIN_VALUE; 
    public int  countGen = Integer.MIN_VALUE; 
    public int  scCode = Integer.MIN_VALUE; 
    public String  molCode; 
    public String  molName; 
    public long  modify_time = Long.MIN_VALUE;
    public SCUsageInputRef usageInputRef = new SCUsageInputRef();
    public SCUsageInputItemKindRef kindRef = new SCUsageInputItemKindRef();
    public static final String tableName = "SCUSAGEINPUTITEM";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "SCUSAGEINPUTITEM.CODE";
    public static final String numberDoc_Attr = "numberDoc";
    public static final String numberDoc_Field = "NUMBERDOC";
    public static final String numberDoc_QFielld = "SCUSAGEINPUTITEM.NUMBERDOC";
    public static final String numberInt_Attr = "numberInt";
    public static final String numberInt_Field = "NUMBERINT";
    public static final String numberInt_QFielld = "SCUSAGEINPUTITEM.NUMBERINT";
    public static final String countGen_Attr = "countGen";
    public static final String countGen_Field = "COUNTGEN";
    public static final String countGen_QFielld = "SCUSAGEINPUTITEM.COUNTGEN";
    public static final String scCode_Attr = "scCode";
    public static final String scCode_Field = "SCCODE";
    public static final String scCode_QFielld = "SCUSAGEINPUTITEM.SCCODE";
    public static final String molCode_Attr = "molCode";
    public static final String molCode_Field = "MOLCODE";
    public static final String molCode_QFielld = "SCUSAGEINPUTITEM.MOLCODE";
    public static final String molName_Attr = "molName";
    public static final String molName_Field = "MOLNAME";
    public static final String molName_QFielld = "SCUSAGEINPUTITEM.MOLNAME";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "SCUSAGEINPUTITEM.MODIFY_TIME";
    public static final String usageInputRef_Attr = "usageInputRef";
    public static final String usageInputRef_Field = "USAGEINPUTREFCODE";
    public static final String  usageInputRef_QFielld = "SCUSAGEINPUTITEM.USAGEINPUTREFCODE";
    public static final String kindRef_Attr = "kindRef";
    public static final String kindRef_Field = "KINDREFCODE";
    public static final String  kindRef_QFielld = "SCUSAGEINPUTITEM.KINDREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setNumberDoc(String aValue){
       numberDoc = aValue;
    }

    public String getNumberDoc(){
       return numberDoc;
    }

    public void setNumberInt(int aValue){
       numberInt = aValue;
    }

    public int getNumberInt(){
       return numberInt;
    }

    public void setCountGen(int aValue){
       countGen = aValue;
    }

    public int getCountGen(){
       return countGen;
    }

    public void setScCode(int aValue){
       scCode = aValue;
    }

    public int getScCode(){
       return scCode;
    }

    public void setMolCode(String aValue){
       molCode = aValue;
    }

    public String getMolCode(){
       return molCode;
    }

    public void setMolName(String aValue){
       molName = aValue;
    }

    public String getMolName(){
       return molName;
    }

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

    public void setUsageInputRef(SCUsageInputRef aValue){
       usageInputRef = aValue;
    }

    public SCUsageInputRef getUsageInputRef(){
       return usageInputRef;
    }
    public void setKindRef(SCUsageInputItemKindRef aValue){
       kindRef = aValue;
    }

    public SCUsageInputItemKindRef getKindRef(){
       return kindRef;
    }

} // end of SCUsageInputItemValueObject



//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENManningTable2TKPositionENManningTable2TKPosition;  	
  */

import java.io.Serializable;

import com.ksoe.energynet.valueobject.references.ENManningTableRef;
import com.ksoe.techcard.valueobject.references.TKPositionRef;

public class ENManningTable2TKPosition implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  domain_info; 
    public long  modify_time = Long.MIN_VALUE;
    public ENManningTableRef manningTableRef = new ENManningTableRef();
    public TKPositionRef tkpositionRef = new TKPositionRef();
    public static final String tableName = "ENMANNINGTABLE2TKPOSTN";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENMANNINGTABLE2TKPOSTN.CODE";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "ENMANNINGTABLE2TKPOSTN.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENMANNINGTABLE2TKPOSTN.MODIFY_TIME";
    public static final String manningTableRef_Attr = "manningTableRef";
    public static final String manningTableRef_Field = "MANNINGTABLEREFCODE";
    public static final String  manningTableRef_QFielld = "ENMANNINGTABLE2TKPOSTN.MANNINGTABLEREFCODE";
    public static final String tkpositionRef_Attr = "tkpositionRef";
    public static final String tkpositionRef_Field = "TKPOSITIONREFCODE";
    public static final String  tkpositionRef_QFielld = "ENMANNINGTABLE2TKPOSTN.TKPOSITIONREFCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
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
    public void setManningTableRef(ENManningTableRef aValue){
       manningTableRef = aValue;
    }

    public ENManningTableRef getManningTableRef(){
       return manningTableRef;
    }
    public void setTkpositionRef(TKPositionRef aValue){
       tkpositionRef = aValue;
    }

    public TKPositionRef getTkpositionRef(){
       return tkpositionRef;
    }

} // end of ENManningTable2TKPositionValueObject


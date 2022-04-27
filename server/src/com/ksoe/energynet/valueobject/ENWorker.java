
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENWorkerENWorker;  	
  */

import java.io.Serializable;

public class ENWorker implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public String  tabNumber; 
    public int  isMol = Integer.MIN_VALUE; 
    public int  finCode = Integer.MIN_VALUE; 
    public String  commentGen; 
    public String  domain_info; 
    public long  modify_time = Long.MIN_VALUE;
    public ENManningTable manningTable = new ENManningTable();
    public static final String tableName = "ENWORKER";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENWORKER.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENWORKER.NAME";
    public static final String tabNumber_Attr = "tabNumber";
    public static final String tabNumber_Field = "TABNUMBER";
    public static final String tabNumber_QFielld = "ENWORKER.TABNUMBER";
    public static final String isMol_Attr = "isMol";
    public static final String isMol_Field = "ISMOL";
    public static final String isMol_QFielld = "ENWORKER.ISMOL";
    public static final String finCode_Attr = "finCode";
    public static final String finCode_Field = "FINCODE";
    public static final String finCode_QFielld = "ENWORKER.FINCODE";
    public static final String commentGen_Attr = "commentGen";
    public static final String commentGen_Field = "COMMENTGEN";
    public static final String commentGen_QFielld = "ENWORKER.COMMENTGEN";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "ENWORKER.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENWORKER.MODIFY_TIME";
    public static final String manningTable_Attr = "manningTable";
    public static final String manningTable_Field = "MANNINGTABLECODE";
    public static final String  manningTable_QFielld = "ENWORKER.MANNINGTABLECODE";


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

    public void setTabNumber(String aValue){
       tabNumber = aValue;
    }

    public String getTabNumber(){
       return tabNumber;
    }

    public void setIsMol(int aValue){
       isMol = aValue;
    }

    public int getIsMol(){
       return isMol;
    }

    public void setFinCode(int aValue){
       finCode = aValue;
    }

    public int getFinCode(){
       return finCode;
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
    public void setManningTable(ENManningTable aValue){
       manningTable = aValue;
    }

    public ENManningTable getManningTable(){
       return manningTable;
    }

} // end of ENWorkerValueObject


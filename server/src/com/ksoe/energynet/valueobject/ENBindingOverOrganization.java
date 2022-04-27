
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENBindingOverOrganizationENBindingOverOrganization;  	
  */

import java.io.Serializable;


public class ENBindingOverOrganization implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public long  modify_time = Long.MIN_VALUE;
    public static final String tableName = "ENBINDINGOVERORGANIZTN";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENBINDINGOVERORGANIZTN.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENBINDINGOVERORGANIZTN.NAME";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENBINDINGOVERORGANIZTN.MODIFY_TIME";


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

    public void setModify_time(long aValue){
       modify_time = aValue;
    }

    public long getModify_time(){
       return modify_time;
    }

;

} // end of ENBindingOverOrganizationValueObject


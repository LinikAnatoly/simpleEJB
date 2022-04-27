
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENManningTableENManningTable;  	
  */

import java.io.Serializable;
import java.util.Date;

public class ENManningTable implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  name; 
    public Date  dateStart; 
    public Date  dateFinal; 
    public int  finCode = Integer.MIN_VALUE; 
    public String  domain_info; 
    public long  modify_time = Long.MIN_VALUE;
    public ENPosition position = new ENPosition();
    public ENDepartment department = new ENDepartment();
    public static final String tableName = "ENMANNINGTABLE";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENMANNINGTABLE.CODE";
    public static final String name_Attr = "name";
    public static final String name_Field = "NAME";
    public static final String name_QFielld = "ENMANNINGTABLE.NAME";
    public static final String dateStart_Attr = "dateStart";
    public static final String dateStart_Field = "DATESTART";
    public static final String dateStart_QFielld = "ENMANNINGTABLE.DATESTART";
    public static final String dateFinal_Attr = "dateFinal";
    public static final String dateFinal_Field = "DATEFINAL";
    public static final String dateFinal_QFielld = "ENMANNINGTABLE.DATEFINAL";
    public static final String finCode_Attr = "finCode";
    public static final String finCode_Field = "FINCODE";
    public static final String finCode_QFielld = "ENMANNINGTABLE.FINCODE";
    public static final String domain_info_Attr = "domain_info";
    public static final String domain_info_Field = "DOMAIN_INFO";
    public static final String domain_info_QFielld = "ENMANNINGTABLE.DOMAIN_INFO";
    public static final String modify_time_Attr = "modify_time";
    public static final String modify_time_Field = "MODIFY_TIME";
    public static final String modify_time_QFielld = "ENMANNINGTABLE.MODIFY_TIME";
    public static final String position_Attr = "position";
    public static final String position_Field = "POSITIONCODE";
    public static final String  position_QFielld = "ENMANNINGTABLE.POSITIONCODE";
    public static final String department_Attr = "department";
    public static final String department_Field = "DEPARTMENTCODE";
    public static final String  department_QFielld = "ENMANNINGTABLE.DEPARTMENTCODE";


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

    public void setDateStart(Date aValue){
       dateStart = aValue;
    }

    public Date getDateStart(){
       return dateStart;
    }

    public void setDateFinal(Date aValue){
       dateFinal = aValue;
    }

    public Date getDateFinal(){
       return dateFinal;
    }

    public void setFinCode(int aValue){
       finCode = aValue;
    }

    public int getFinCode(){
       return finCode;
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
    public void setPosition(ENPosition aValue){
       position = aValue;
    }

    public ENPosition getPosition(){
       return position;
    }
    public void setDepartment(ENDepartment aValue){
       department = aValue;
    }

    public ENDepartment getDepartment(){
       return department;
    }

} // end of ENManningTableValueObject


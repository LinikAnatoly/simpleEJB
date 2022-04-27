
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject;



  /**
  * Value Object for ENSpravMol;  	
  */

import java.io.Serializable;

public class ENSpravMol implements Serializable {

    public int  code = Integer.MIN_VALUE; 
    public String  molkod; 
    public String  molname; 
    public ENDepartment department = new ENDepartment();
    public static final String tableName = "ENSPRAVMOL";
    public static final String code_Attr = "code";
    public static final String code_Field = "CODE";
    public static final String code_QFielld = "ENSPRAVMOL.CODE";
    public static final String molkod_Attr = "molkod";
    public static final String molkod_Field = "MOLKOD";
    public static final String molkod_QFielld = "ENSPRAVMOL.MOLKOD";
    public static final String molname_Attr = "molname";
    public static final String molname_Field = "MOLNAME";
    public static final String molname_QFielld = "ENSPRAVMOL.MOLNAME";
    public static final String department_Attr = "department";
    public static final String department_Field = "DEPARTMENTCODE";
    public static final String  department_QFielld = "ENSPRAVMOL.DEPARTMENTCODE";


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setMolkod(String aValue){
       molkod = aValue;
    }

    public String getMolkod(){
       return molkod;
    }

    public void setMolname(String aValue){
       molname = aValue;
    }

    public String getMolname(){
       return molname;
    }

    public void setDepartment(ENDepartment aValue){
       department = aValue;
    }

    public ENDepartment getDepartment(){
       return department;
    }

} // end of ENSpravMolValueObject


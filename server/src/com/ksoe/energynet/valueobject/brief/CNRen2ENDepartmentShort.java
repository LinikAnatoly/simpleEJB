
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for CNRen2ENDepartment;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class CNRen2ENDepartmentShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int cnRenCode = Integer.MIN_VALUE;
    public int departmentRefCode = Integer.MIN_VALUE;
    public String departmentRefShortName;
    public Date departmentRefDateStart;
    public Date departmentRefDateFinal;
    public String departmentRefShpzBalans;
    public int departmentRefKau_table_id_1884 = Integer.MIN_VALUE;
    public String departmentRefKau_1884;
    public String departmentRefName_1884;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setCnRenCode(int aValue){
       cnRenCode = aValue;
    }

    public int getCnRenCode(){
       return cnRenCode;
    }


    public void setDepartmentRefCode(int aValue){
       departmentRefCode = aValue;
    }
    public int getDepartmentRefCode(){
       return departmentRefCode;
    }

    public void setDepartmentRefShortName(String aValue){
       departmentRefShortName = aValue;
    }
    public String getDepartmentRefShortName(){
       return departmentRefShortName;
    }


    public void setDepartmentRefDateStart(Date aValue){
       departmentRefDateStart = aValue;
    }
    public Date getDepartmentRefDateStart(){
       return departmentRefDateStart;
    }


    public void setDepartmentRefDateFinal(Date aValue){
       departmentRefDateFinal = aValue;
    }
    public Date getDepartmentRefDateFinal(){
       return departmentRefDateFinal;
    }

    public void setDepartmentRefShpzBalans(String aValue){
       departmentRefShpzBalans = aValue;
    }
    public String getDepartmentRefShpzBalans(){
       return departmentRefShpzBalans;
    }

    public void setDepartmentRefKau_table_id_1884(int aValue){
       departmentRefKau_table_id_1884 = aValue;
    }
    public int getDepartmentRefKau_table_id_1884(){
       return departmentRefKau_table_id_1884;
    }

    public void setDepartmentRefKau_1884(String aValue){
       departmentRefKau_1884 = aValue;
    }
    public String getDepartmentRefKau_1884(){
       return departmentRefKau_1884;
    }

    public void setDepartmentRefName_1884(String aValue){
       departmentRefName_1884 = aValue;
    }
    public String getDepartmentRefName_1884(){
       return departmentRefName_1884;
    }



}
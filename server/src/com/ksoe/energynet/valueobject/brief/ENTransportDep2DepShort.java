
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTransportDep2Dep;  	
  */

import java.io.Serializable;
import java.util.Date;


public class ENTransportDep2DepShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int transportDepartmentCode = Integer.MIN_VALUE;
    public String transportDepartmentName;
    public int departmentCode = Integer.MIN_VALUE;
    public String departmentShortName;
    public Date departmentDateStart;
    public Date departmentDateFinal;
    public String departmentShpzBalans;
    public int departmentKau_table_id_1884 = Integer.MIN_VALUE;
    public String departmentKau_1884;
    public String departmentName_1884;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setTransportDepartmentCode(int aValue){
       transportDepartmentCode = aValue;
    }
    public int getTransportDepartmentCode(){
       return transportDepartmentCode;
    }

    public void setTransportDepartmentName(String aValue){
       transportDepartmentName = aValue;
    }
    public String getTransportDepartmentName(){
       return transportDepartmentName;
    }

    public void setDepartmentCode(int aValue){
       departmentCode = aValue;
    }
    public int getDepartmentCode(){
       return departmentCode;
    }

    public void setDepartmentShortName(String aValue){
       departmentShortName = aValue;
    }
    public String getDepartmentShortName(){
       return departmentShortName;
    }


    public void setDepartmentDateStart(Date aValue){
       departmentDateStart = aValue;
    }
    public Date getDepartmentDateStart(){
       return departmentDateStart;
    }


    public void setDepartmentDateFinal(Date aValue){
       departmentDateFinal = aValue;
    }
    public Date getDepartmentDateFinal(){
       return departmentDateFinal;
    }

    public void setDepartmentShpzBalans(String aValue){
       departmentShpzBalans = aValue;
    }
    public String getDepartmentShpzBalans(){
       return departmentShpzBalans;
    }

    public void setDepartmentKau_table_id_1884(int aValue){
       departmentKau_table_id_1884 = aValue;
    }
    public int getDepartmentKau_table_id_1884(){
       return departmentKau_table_id_1884;
    }

    public void setDepartmentKau_1884(String aValue){
       departmentKau_1884 = aValue;
    }
    public String getDepartmentKau_1884(){
       return departmentKau_1884;
    }

    public void setDepartmentName_1884(String aValue){
       departmentName_1884 = aValue;
    }
    public String getDepartmentName_1884(){
       return departmentName_1884;
    }



}
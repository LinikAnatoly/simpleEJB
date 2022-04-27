
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENMol2Department;  	
  */

import java.io.Serializable;
import java.util.Date;


public class ENMol2DepartmentShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int molCode = Integer.MIN_VALUE;
    public String molFinCode;
    public String molName;
    public int departmentRefCode = Integer.MIN_VALUE;
    public String departmentRefShortName;
    public Date departmentRefDateStart;
    public Date departmentRefDateFinal;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setMolCode(int aValue){
       molCode = aValue;
    }
    public int getMolCode(){
       return molCode;
    }

    public void setMolFinCode(String aValue){
       molFinCode = aValue;
    }
    public String getMolFinCode(){
       return molFinCode;
    }

    public void setMolName(String aValue){
       molName = aValue;
    }
    public String getMolName(){
       return molName;
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



}
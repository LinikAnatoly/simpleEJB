
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENSpravMol;  	
  */

import java.io.Serializable;
import java.util.Date;


public class ENSpravMolShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String molkod;
    public String molname;
    public int departmentCode = Integer.MIN_VALUE;
    public String departmentShortName;
    public Date departmentDateStart;
    public Date departmentDateFinal;

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



}
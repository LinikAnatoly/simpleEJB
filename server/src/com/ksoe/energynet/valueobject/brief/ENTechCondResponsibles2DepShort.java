
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTechCondResponsibles2Dep;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENTechCondResponsibles2DepShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int techCondResponsiblesRefCode = Integer.MIN_VALUE;
    public String techCondResponsiblesRefResponsibleFIO;
    public int techCondResponsiblesRefResponsibleTabNumber = Integer.MIN_VALUE;
    public String techCondResponsiblesRefResponsiblePosition;
    public String techCondResponsiblesRefResponsibleDepName;
    public String techCondResponsiblesRefResponsibleDepCode;
    public int techCondResponsiblesRefPower = Integer.MIN_VALUE;
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


    public void setTechCondResponsiblesRefCode(int aValue){
       techCondResponsiblesRefCode = aValue;
    }
    public int getTechCondResponsiblesRefCode(){
       return techCondResponsiblesRefCode;
    }

    public void setTechCondResponsiblesRefResponsibleFIO(String aValue){
       techCondResponsiblesRefResponsibleFIO = aValue;
    }
    public String getTechCondResponsiblesRefResponsibleFIO(){
       return techCondResponsiblesRefResponsibleFIO;
    }

    public void setTechCondResponsiblesRefResponsibleTabNumber(int aValue){
       techCondResponsiblesRefResponsibleTabNumber = aValue;
    }
    public int getTechCondResponsiblesRefResponsibleTabNumber(){
       return techCondResponsiblesRefResponsibleTabNumber;
    }

    public void setTechCondResponsiblesRefResponsiblePosition(String aValue){
       techCondResponsiblesRefResponsiblePosition = aValue;
    }
    public String getTechCondResponsiblesRefResponsiblePosition(){
       return techCondResponsiblesRefResponsiblePosition;
    }

    public void setTechCondResponsiblesRefResponsibleDepName(String aValue){
       techCondResponsiblesRefResponsibleDepName = aValue;
    }
    public String getTechCondResponsiblesRefResponsibleDepName(){
       return techCondResponsiblesRefResponsibleDepName;
    }

    public void setTechCondResponsiblesRefResponsibleDepCode(String aValue){
       techCondResponsiblesRefResponsibleDepCode = aValue;
    }
    public String getTechCondResponsiblesRefResponsibleDepCode(){
       return techCondResponsiblesRefResponsibleDepCode;
    }

    public void setTechCondResponsiblesRefPower(int aValue){
       techCondResponsiblesRefPower = aValue;
    }
    public int getTechCondResponsiblesRefPower(){
       return techCondResponsiblesRefPower;
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
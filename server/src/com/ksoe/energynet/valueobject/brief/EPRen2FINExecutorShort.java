
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for EPRen2FINExecutor;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class EPRen2FINExecutorShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int renRefCode = Integer.MIN_VALUE;
    public String renRefName;
    public int finExecutorRefCode = Integer.MIN_VALUE;
    public String finExecutorRefName;
    public int finExecutorRefFinCode = Integer.MIN_VALUE;
    public String finExecutorRefFinTypeName;
    public int finExecutorRefFinTypeCode = Integer.MIN_VALUE;
    public String finExecutorRefFinKindName;
    public int finExecutorRefFinKindCode = Integer.MIN_VALUE;
    public String finExecutorRefFinCehName;
    public int finExecutorRefFinCehCode = Integer.MIN_VALUE;
    public int departmentRefCode = Integer.MIN_VALUE;
    public String departmentRefShortName;
    public Date departmentRefDateStart;
    public Date departmentRefDateFinal;
    public int departmentRefRenCode = Integer.MIN_VALUE;
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


    public void setRenRefCode(int aValue){
       renRefCode = aValue;
    }
    public int getRenRefCode(){
       return renRefCode;
    }

    public void setRenRefName(String aValue){
       renRefName = aValue;
    }
    public String getRenRefName(){
       return renRefName;
    }

    public void setFinExecutorRefCode(int aValue){
       finExecutorRefCode = aValue;
    }
    public int getFinExecutorRefCode(){
       return finExecutorRefCode;
    }

    public void setFinExecutorRefName(String aValue){
       finExecutorRefName = aValue;
    }
    public String getFinExecutorRefName(){
       return finExecutorRefName;
    }

    public void setFinExecutorRefFinCode(int aValue){
       finExecutorRefFinCode = aValue;
    }
    public int getFinExecutorRefFinCode(){
       return finExecutorRefFinCode;
    }

    public void setFinExecutorRefFinTypeName(String aValue){
       finExecutorRefFinTypeName = aValue;
    }
    public String getFinExecutorRefFinTypeName(){
       return finExecutorRefFinTypeName;
    }

    public void setFinExecutorRefFinTypeCode(int aValue){
       finExecutorRefFinTypeCode = aValue;
    }
    public int getFinExecutorRefFinTypeCode(){
       return finExecutorRefFinTypeCode;
    }

    public void setFinExecutorRefFinKindName(String aValue){
       finExecutorRefFinKindName = aValue;
    }
    public String getFinExecutorRefFinKindName(){
       return finExecutorRefFinKindName;
    }

    public void setFinExecutorRefFinKindCode(int aValue){
       finExecutorRefFinKindCode = aValue;
    }
    public int getFinExecutorRefFinKindCode(){
       return finExecutorRefFinKindCode;
    }

    public void setFinExecutorRefFinCehName(String aValue){
       finExecutorRefFinCehName = aValue;
    }
    public String getFinExecutorRefFinCehName(){
       return finExecutorRefFinCehName;
    }

    public void setFinExecutorRefFinCehCode(int aValue){
       finExecutorRefFinCehCode = aValue;
    }
    public int getFinExecutorRefFinCehCode(){
       return finExecutorRefFinCehCode;
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

    public void setDepartmentRefRenCode(int aValue){
       departmentRefRenCode = aValue;
    }
    public int getDepartmentRefRenCode(){
       return departmentRefRenCode;
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
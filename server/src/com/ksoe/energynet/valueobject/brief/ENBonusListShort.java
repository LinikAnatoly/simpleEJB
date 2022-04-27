
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENBonusList;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENBonusListShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String numberGen;
    public int monthGen = Integer.MIN_VALUE;
    public int yearGen = Integer.MIN_VALUE;
    public String userAdd;
    public Date dateAdd ;
    public String userGen;
    public Date dateEdit ;
    public int departmentCode = Integer.MIN_VALUE;
    public String departmentShortName;
    public Date departmentDateStart;
    public Date departmentDateFinal;
    public int departmentRenCode = Integer.MIN_VALUE;
    public String departmentShpzBalans;
    public int departmentKau_table_id_1884 = Integer.MIN_VALUE;
    public String departmentKau_1884;
    public String departmentName_1884;
    public String departmentHrmorganizationid;
    public int kindRefCode = Integer.MIN_VALUE;
    public String kindRefName;
    public int statusCode = Integer.MIN_VALUE;
    public String statusName;


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setNumberGen(String aValue){
       numberGen = aValue;
    }

    public String getNumberGen(){
       return numberGen;
    }

    public void setMonthGen(int aValue){
       monthGen = aValue;
    }

    public int getMonthGen(){
       return monthGen;
    }

    public void setYearGen(int aValue){
       yearGen = aValue;
    }

    public int getYearGen(){
       return yearGen;
    }

    public void setUserAdd(String aValue){
       userAdd = aValue;
    }

    public String getUserAdd(){
       return userAdd;
    }

    public void setDateAdd(Date aValue){
       dateAdd = aValue;
    }

    public Date getDateAdd(){
       return dateAdd;
    }

    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }

    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
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

    public void setDepartmentRenCode(int aValue){
       departmentRenCode = aValue;
    }
    public int getDepartmentRenCode(){
       return departmentRenCode;
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

    public void setDepartmentHrmorganizationid(String aValue){
       departmentHrmorganizationid = aValue;
    }
    public String getDepartmentHrmorganizationid(){
       return departmentHrmorganizationid;
    }

    public void setKindRefCode(int aValue){
       kindRefCode = aValue;
    }
    public int getKindRefCode(){
       return kindRefCode;
    }

    public void setKindRefName(String aValue){
       kindRefName = aValue;
    }
    public String getKindRefName(){
       return kindRefName;
    }

    public void setStatusCode(int aValue){
       statusCode = aValue;
    }
    public int getStatusCode(){
       return statusCode;
    }

    public void setStatusName(String aValue){
       statusName = aValue;
    }
    public String getStatusName(){
       return statusName;
    }



}
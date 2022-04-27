
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENPurchasesNoObject;  	
  */

import java.io.Serializable;
import java.util.Date;


public class ENPurchasesNoObjectShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String name;
    public int budgetCode = Integer.MIN_VALUE;
    public String budgetShortName;
    public Date budgetDateStart;
    public Date budgetDateFinal;
    public int departmentCode = Integer.MIN_VALUE;
    public String departmentShortName;
    public Date departmentDateStart;
    public Date departmentDateFinal;
    public int elementCode = Integer.MIN_VALUE;
    public int typeRefCode = Integer.MIN_VALUE;
    public String typeRefName;

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

    public void setBudgetCode(int aValue){
       budgetCode = aValue;
    }
    public int getBudgetCode(){
       return budgetCode;
    }

    public void setBudgetShortName(String aValue){
       budgetShortName = aValue;
    }
    public String getBudgetShortName(){
       return budgetShortName;
    }

    public void setBudgetDateStart(Date aValue){
       budgetDateStart = aValue;
    }
    public Date getBudgetDateStart(){
       return budgetDateStart;
    }

    public void setBudgetDateFinal(Date aValue){
       budgetDateFinal = aValue;
    }
    public Date getBudgetDateFinal(){
       return budgetDateFinal;
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

    public void setElementCode(int aValue){
       elementCode = aValue;
    }
    public int getElementCode(){
       return elementCode;
    }

    public void setTypeRefCode(int aValue){
       typeRefCode = aValue;
    }
    public int getTypeRefCode(){
       return typeRefCode;
    }

    public void setTypeRefName(String aValue){
       typeRefName = aValue;
    }
    public String getTypeRefName(){
       return typeRefName;
    }




}
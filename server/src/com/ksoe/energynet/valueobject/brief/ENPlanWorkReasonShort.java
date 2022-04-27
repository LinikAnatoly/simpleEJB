
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENPlanWorkReason;  	
  */

import java.io.Serializable;
import java.util.Date;


public class ENPlanWorkReasonShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public Date dateGen ;
    public String numberGen;
    public String name;
    public Date dateEdit ;
    public String userGen;
    public int managementCode = Integer.MIN_VALUE;
    public String managementName;
    public int reasonTypeCode = Integer.MIN_VALUE;
    public String reasonTypeName;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setDateGen(Date aValue){
       dateGen = aValue;
    }

    public Date getDateGen(){
       return dateGen;
    }
    public void setNumberGen(String aValue){
       numberGen = aValue;
    }

    public String getNumberGen(){
       return numberGen;
    }
    public void setName(String aValue){
       name = aValue;
    }

    public String getName(){
       return name;
    }

    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }
    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }


    public void setManagementCode(int aValue){
       managementCode = aValue;
    }
    public int getManagementCode(){
       return managementCode;
    }

    public void setManagementName(String aValue){
       managementName = aValue;
    }
    public String getManagementName(){
       return managementName;
    }

    public void setReasonTypeCode(int aValue){
       reasonTypeCode = aValue;
    }
    public int getReasonTypeCode(){
       return reasonTypeCode;
    }

    public void setReasonTypeName(String aValue){
       reasonTypeName = aValue;
    }
    public String getReasonTypeName(){
       return reasonTypeName;
    }



}
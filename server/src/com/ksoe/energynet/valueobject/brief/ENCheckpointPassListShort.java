
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENCheckpointPassList;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENCheckpointPassListShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public Date dateStart ;
    public Date dateFinal ;
    public String userGen;
    public Date dateEdit ;
    public int checkpointRefCode = Integer.MIN_VALUE;
    public String checkpointRefName;
    public int transportDepartmentRefCode = Integer.MIN_VALUE;
    public String transportDepartmentRefName;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setDateStart(Date aValue){
       dateStart = aValue;
    }

    public Date getDateStart(){
       return dateStart;
    }

    public void setDateFinal(Date aValue){
       dateFinal = aValue;
    }

    public Date getDateFinal(){
       return dateFinal;
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


    public void setCheckpointRefCode(int aValue){
       checkpointRefCode = aValue;
    }
    public int getCheckpointRefCode(){
       return checkpointRefCode;
    }

    public void setCheckpointRefName(String aValue){
       checkpointRefName = aValue;
    }
    public String getCheckpointRefName(){
       return checkpointRefName;
    }

    public void setTransportDepartmentRefCode(int aValue){
       transportDepartmentRefCode = aValue;
    }
    public int getTransportDepartmentRefCode(){
       return transportDepartmentRefCode;
    }

    public void setTransportDepartmentRefName(String aValue){
       transportDepartmentRefName = aValue;
    }
    public String getTransportDepartmentRefName(){
       return transportDepartmentRefName;
    }



}
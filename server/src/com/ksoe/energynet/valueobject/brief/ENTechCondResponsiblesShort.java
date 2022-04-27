
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTechCondResponsibles;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENTechCondResponsiblesShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String responsibleFIO;
    public int responsibleTabNumber = Integer.MIN_VALUE;
    public String responsiblePosition;
    public String responsibleDepName;
    public String responsibleDepCode;
    public String responsiblePhone;
    public int power = Integer.MIN_VALUE;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setResponsibleFIO(String aValue){
       responsibleFIO = aValue;
    }

    public String getResponsibleFIO(){
       return responsibleFIO;
    }
    public void setResponsibleTabNumber(int aValue){
       responsibleTabNumber = aValue;
    }

    public int getResponsibleTabNumber(){
       return responsibleTabNumber;
    }
    public void setResponsiblePosition(String aValue){
       responsiblePosition = aValue;
    }

    public String getResponsiblePosition(){
       return responsiblePosition;
    }
    public void setResponsibleDepName(String aValue){
       responsibleDepName = aValue;
    }

    public String getResponsibleDepName(){
       return responsibleDepName;
    }
    public void setResponsibleDepCode(String aValue){
       responsibleDepCode = aValue;
    }

    public String getResponsibleDepCode(){
       return responsibleDepCode;
    }
    public void setResponsiblePhone(String aValue){
       responsiblePhone = aValue;
    }

    public String getResponsiblePhone(){
       return responsiblePhone;
    }
    public void setPower(int aValue){
       power = aValue;
    }

    public int getPower(){
       return power;
    }




}
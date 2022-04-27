
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENResponsibles;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENResponsiblesShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String FIO;
    public String tabNumber;
    public String position;
    public String depName;
    public String depCode;
    public String phone;
    public int kindRefCode = Integer.MIN_VALUE;
    public String kindRefName;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setFIO(String aValue){
       FIO = aValue;
    }

    public String getFIO(){
       return FIO;
    }
    public void setTabNumber(String aValue){
       tabNumber = aValue;
    }

    public String getTabNumber(){
       return tabNumber;
    }
    public void setPosition(String aValue){
       position = aValue;
    }

    public String getPosition(){
       return position;
    }
    public void setDepName(String aValue){
       depName = aValue;
    }

    public String getDepName(){
       return depName;
    }
    public void setDepCode(String aValue){
       depCode = aValue;
    }

    public String getDepCode(){
       return depCode;
    }
    public void setPhone(String aValue){
       phone = aValue;
    }

    public String getPhone(){
       return phone;
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



}
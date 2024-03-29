
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENBonusListStatus;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENBonusListStatusShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String name;


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




}
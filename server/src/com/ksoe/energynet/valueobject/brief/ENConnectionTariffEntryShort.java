
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENConnectionTariffEntry;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENConnectionTariffEntryShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal value;
    public Date startDate ;
    public String userGen;
    public int tariffRefCode = Integer.MIN_VALUE;
    public String tariffRefName;
    public String tariffRefShortname;
    public String tariffRefUserGen;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setValue(BigDecimal aValue){
       value = aValue;
    }

    public BigDecimal getValue(){
       return value;
    }

    public void setStartDate(Date aValue){
       startDate = aValue;
    }

    public Date getStartDate(){
       return startDate;
    }
    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }


    public void setTariffRefCode(int aValue){
       tariffRefCode = aValue;
    }
    public int getTariffRefCode(){
       return tariffRefCode;
    }

    public void setTariffRefName(String aValue){
       tariffRefName = aValue;
    }
    public String getTariffRefName(){
       return tariffRefName;
    }

    public void setTariffRefShortname(String aValue){
       tariffRefShortname = aValue;
    }
    public String getTariffRefShortname(){
       return tariffRefShortname;
    }

    public void setTariffRefUserGen(String aValue){
       tariffRefUserGen = aValue;
    }
    public String getTariffRefUserGen(){
       return tariffRefUserGen;
    }



}
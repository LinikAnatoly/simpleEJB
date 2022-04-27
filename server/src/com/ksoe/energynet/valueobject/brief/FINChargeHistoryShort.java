
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for FINChargeHistory;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class FINChargeHistoryShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal chargePercent;
    public Date dategen ;
    public int chargeRefCode = Integer.MIN_VALUE;
    public String chargeRefName;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setChargePercent(BigDecimal aValue){
       chargePercent = aValue;
    }

    public BigDecimal getChargePercent(){
       return chargePercent;
    }

    public void setDategen(Date aValue){
       dategen = aValue;
    }

    public Date getDategen(){
       return dategen;
    }


    public void setChargeRefCode(int aValue){
       chargeRefCode = aValue;
    }
    public int getChargeRefCode(){
       return chargeRefCode;
    }

    public void setChargeRefName(String aValue){
       chargeRefName = aValue;
    }
    public String getChargeRefName(){
       return chargeRefName;
    }



}
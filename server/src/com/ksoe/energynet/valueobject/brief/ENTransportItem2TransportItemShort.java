
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTransportItem2TransportItem;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENTransportItem2TransportItemShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int inRefCode = Integer.MIN_VALUE;
    public BigDecimal inRefCountWorkGen;
    public BigDecimal inRefCountWorkFact;
    public BigDecimal inRefPrice;
    public BigDecimal inRefCost;
    public String inRefUserGen;
    public Date inRefDateEdit;
    public int outRefCode = Integer.MIN_VALUE;
    public BigDecimal outRefCountWorkGen;
    public BigDecimal outRefCountWorkFact;
    public BigDecimal outRefPrice;
    public BigDecimal outRefCost;
    public String outRefUserGen;
    public Date outRefDateEdit;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setInRefCode(int aValue){
       inRefCode = aValue;
    }
    public int getInRefCode(){
       return inRefCode;
    }

    public void setInRefCountWorkGen(BigDecimal aValue){
       inRefCountWorkGen = aValue;
    }
    public BigDecimal getInRefCountWorkGen(){
       return inRefCountWorkGen;
    }

    public void setInRefCountWorkFact(BigDecimal aValue){
       inRefCountWorkFact = aValue;
    }
    public BigDecimal getInRefCountWorkFact(){
       return inRefCountWorkFact;
    }

    public void setInRefPrice(BigDecimal aValue){
       inRefPrice = aValue;
    }
    public BigDecimal getInRefPrice(){
       return inRefPrice;
    }

    public void setInRefCost(BigDecimal aValue){
       inRefCost = aValue;
    }
    public BigDecimal getInRefCost(){
       return inRefCost;
    }

    public void setInRefUserGen(String aValue){
       inRefUserGen = aValue;
    }
    public String getInRefUserGen(){
       return inRefUserGen;
    }


    public void setInRefDateEdit(Date aValue){
       inRefDateEdit = aValue;
    }
    public Date getInRefDateEdit(){
       return inRefDateEdit;
    }

    public void setOutRefCode(int aValue){
       outRefCode = aValue;
    }
    public int getOutRefCode(){
       return outRefCode;
    }

    public void setOutRefCountWorkGen(BigDecimal aValue){
       outRefCountWorkGen = aValue;
    }
    public BigDecimal getOutRefCountWorkGen(){
       return outRefCountWorkGen;
    }

    public void setOutRefCountWorkFact(BigDecimal aValue){
       outRefCountWorkFact = aValue;
    }
    public BigDecimal getOutRefCountWorkFact(){
       return outRefCountWorkFact;
    }

    public void setOutRefPrice(BigDecimal aValue){
       outRefPrice = aValue;
    }
    public BigDecimal getOutRefPrice(){
       return outRefPrice;
    }

    public void setOutRefCost(BigDecimal aValue){
       outRefCost = aValue;
    }
    public BigDecimal getOutRefCost(){
       return outRefCost;
    }

    public void setOutRefUserGen(String aValue){
       outRefUserGen = aValue;
    }
    public String getOutRefUserGen(){
       return outRefUserGen;
    }


    public void setOutRefDateEdit(Date aValue){
       outRefDateEdit = aValue;
    }
    public Date getOutRefDateEdit(){
       return outRefDateEdit;
    }



}
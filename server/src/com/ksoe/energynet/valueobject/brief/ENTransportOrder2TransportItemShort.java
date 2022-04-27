
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTransportOrder2TransportItem;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENTransportOrder2TransportItemShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int transportOrderCode = Integer.MIN_VALUE;
    public Date transportOrderTimeStart;
    public Date transportOrderTimeFinal;
    public Date transportOrderDateStart;
    public Date transportOrderDateFinal;
    public Date transportOrderDateEdit;
    public String transportOrderUserGen;
    public int transportItemCode = Integer.MIN_VALUE;
    public BigDecimal transportItemCountWorkGen;
    public BigDecimal transportItemCountWorkFact;
    public BigDecimal transportItemPrice;
    public BigDecimal transportItemCost;
    public String transportItemUserGen;
    public Date transportItemDateEdit;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setTransportOrderCode(int aValue){
       transportOrderCode = aValue;
    }
    public int getTransportOrderCode(){
       return transportOrderCode;
    }


    public void setTransportOrderTimeStart(Date aValue){
       transportOrderTimeStart = aValue;
    }
    public Date getTransportOrderTimeStart(){
       return transportOrderTimeStart;
    }


    public void setTransportOrderTimeFinal(Date aValue){
       transportOrderTimeFinal = aValue;
    }
    public Date getTransportOrderTimeFinal(){
       return transportOrderTimeFinal;
    }


    public void setTransportOrderDateStart(Date aValue){
       transportOrderDateStart = aValue;
    }
    public Date getTransportOrderDateStart(){
       return transportOrderDateStart;
    }


    public void setTransportOrderDateFinal(Date aValue){
       transportOrderDateFinal = aValue;
    }
    public Date getTransportOrderDateFinal(){
       return transportOrderDateFinal;
    }


    public void setTransportOrderDateEdit(Date aValue){
       transportOrderDateEdit = aValue;
    }
    public Date getTransportOrderDateEdit(){
       return transportOrderDateEdit;
    }

    public void setTransportOrderUserGen(String aValue){
       transportOrderUserGen = aValue;
    }
    public String getTransportOrderUserGen(){
       return transportOrderUserGen;
    }

    public void setTransportItemCode(int aValue){
       transportItemCode = aValue;
    }
    public int getTransportItemCode(){
       return transportItemCode;
    }

    public void setTransportItemCountWorkGen(BigDecimal aValue){
       transportItemCountWorkGen = aValue;
    }
    public BigDecimal getTransportItemCountWorkGen(){
       return transportItemCountWorkGen;
    }

    public void setTransportItemCountWorkFact(BigDecimal aValue){
       transportItemCountWorkFact = aValue;
    }
    public BigDecimal getTransportItemCountWorkFact(){
       return transportItemCountWorkFact;
    }

    public void setTransportItemPrice(BigDecimal aValue){
       transportItemPrice = aValue;
    }
    public BigDecimal getTransportItemPrice(){
       return transportItemPrice;
    }

    public void setTransportItemCost(BigDecimal aValue){
       transportItemCost = aValue;
    }
    public BigDecimal getTransportItemCost(){
       return transportItemCost;
    }

    public void setTransportItemUserGen(String aValue){
       transportItemUserGen = aValue;
    }
    public String getTransportItemUserGen(){
       return transportItemUserGen;
    }


    public void setTransportItemDateEdit(Date aValue){
       transportItemDateEdit = aValue;
    }
    public Date getTransportItemDateEdit(){
       return transportItemDateEdit;
    }



}
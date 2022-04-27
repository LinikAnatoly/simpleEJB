
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENPWI2Element;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENPWI2ElementShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal countGen;
    public int planWorkItemRefCode = Integer.MIN_VALUE;
    public BigDecimal planWorkItemRefCountGen;
    public BigDecimal planWorkItemRefTimeGen;
    public BigDecimal planWorkItemRefCostGen;
    public String planWorkItemRefUserGen;
    public Date planWorkItemRefDateEdit;
    public int elementRefCode = Integer.MIN_VALUE;


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setCountGen(BigDecimal aValue){
       countGen = aValue;
    }

    public BigDecimal getCountGen(){
       return countGen;
    }


    public void setPlanWorkItemRefCode(int aValue){
       planWorkItemRefCode = aValue;
    }
    public int getPlanWorkItemRefCode(){
       return planWorkItemRefCode;
    }

    public void setPlanWorkItemRefCountGen(BigDecimal aValue){
       planWorkItemRefCountGen = aValue;
    }
    public BigDecimal getPlanWorkItemRefCountGen(){
       return planWorkItemRefCountGen;
    }

    public void setPlanWorkItemRefTimeGen(BigDecimal aValue){
       planWorkItemRefTimeGen = aValue;
    }
    public BigDecimal getPlanWorkItemRefTimeGen(){
       return planWorkItemRefTimeGen;
    }

    public void setPlanWorkItemRefCostGen(BigDecimal aValue){
       planWorkItemRefCostGen = aValue;
    }
    public BigDecimal getPlanWorkItemRefCostGen(){
       return planWorkItemRefCostGen;
    }

    public void setPlanWorkItemRefUserGen(String aValue){
       planWorkItemRefUserGen = aValue;
    }
    public String getPlanWorkItemRefUserGen(){
       return planWorkItemRefUserGen;
    }

    public void setPlanWorkItemRefDateEdit(Date aValue){
       planWorkItemRefDateEdit = aValue;
    }
    public Date getPlanWorkItemRefDateEdit(){
       return planWorkItemRefDateEdit;
    }

    public void setElementRefCode(int aValue){
       elementRefCode = aValue;
    }
    public int getElementRefCode(){
       return elementRefCode;
    }



}
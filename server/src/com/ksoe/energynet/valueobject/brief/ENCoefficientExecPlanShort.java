
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENCoefficientExecPlan;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENCoefficientExecPlanShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal coefficient;
    public Date dateGen ;
    public int finPodrCode = Integer.MIN_VALUE;
    public String axOrgId;


    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setCoefficient(BigDecimal aValue){
       coefficient = aValue;
    }

    public BigDecimal getCoefficient(){
       return coefficient;
    }

    public void setDateGen(Date aValue){
       dateGen = aValue;
    }

    public Date getDateGen(){
       return dateGen;
    }

    public void setFinPodrCode(int aValue){
       finPodrCode = aValue;
    }

    public int getFinPodrCode(){
       return finPodrCode;
    }

    public void setAxOrgId(String aValue){
       axOrgId = aValue;
    }

    public String getAxOrgId(){
       return axOrgId;
    }




}
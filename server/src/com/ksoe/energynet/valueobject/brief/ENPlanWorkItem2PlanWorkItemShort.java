
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENPlanWorkItem2PlanWorkItem;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENPlanWorkItem2PlanWorkItemShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal countGen;
    public int typeRefCode = Integer.MIN_VALUE;
    public String typeRefName;
    public int planItemInRefCode = Integer.MIN_VALUE;
    public BigDecimal planItemInRefCountGen;
    public BigDecimal planItemInRefTimeGen;
    public String planItemInRefUserGen;
    public Date planItemInRefDateEdit;
    public int planItemOutRefCode = Integer.MIN_VALUE;
    public BigDecimal planItemOutRefCountGen;
    public BigDecimal planItemOutRefTimeGen;
    public String planItemOutRefUserGen;
    public Date planItemOutRefDateEdit;

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


    public void setTypeRefCode(int aValue){
       typeRefCode = aValue;
    }
    public int getTypeRefCode(){
       return typeRefCode;
    }

    public void setTypeRefName(String aValue){
       typeRefName = aValue;
    }
    public String getTypeRefName(){
       return typeRefName;
    }

    public void setPlanItemInRefCode(int aValue){
       planItemInRefCode = aValue;
    }
    public int getPlanItemInRefCode(){
       return planItemInRefCode;
    }

    public void setPlanItemInRefCountGen(BigDecimal aValue){
       planItemInRefCountGen = aValue;
    }
    public BigDecimal getPlanItemInRefCountGen(){
       return planItemInRefCountGen;
    }

    public void setPlanItemInRefTimeGen(BigDecimal aValue){
       planItemInRefTimeGen = aValue;
    }
    public BigDecimal getPlanItemInRefTimeGen(){
       return planItemInRefTimeGen;
    }

    public void setPlanItemInRefUserGen(String aValue){
       planItemInRefUserGen = aValue;
    }
    public String getPlanItemInRefUserGen(){
       return planItemInRefUserGen;
    }


    public void setPlanItemInRefDateEdit(Date aValue){
       planItemInRefDateEdit = aValue;
    }
    public Date getPlanItemInRefDateEdit(){
       return planItemInRefDateEdit;
    }

    public void setPlanItemOutRefCode(int aValue){
       planItemOutRefCode = aValue;
    }
    public int getPlanItemOutRefCode(){
       return planItemOutRefCode;
    }

    public void setPlanItemOutRefCountGen(BigDecimal aValue){
       planItemOutRefCountGen = aValue;
    }
    public BigDecimal getPlanItemOutRefCountGen(){
       return planItemOutRefCountGen;
    }

    public void setPlanItemOutRefTimeGen(BigDecimal aValue){
       planItemOutRefTimeGen = aValue;
    }
    public BigDecimal getPlanItemOutRefTimeGen(){
       return planItemOutRefTimeGen;
    }

    public void setPlanItemOutRefUserGen(String aValue){
       planItemOutRefUserGen = aValue;
    }
    public String getPlanItemOutRefUserGen(){
       return planItemOutRefUserGen;
    }


    public void setPlanItemOutRefDateEdit(Date aValue){
       planItemOutRefDateEdit = aValue;
    }
    public Date getPlanItemOutRefDateEdit(){
       return planItemOutRefDateEdit;
    }



}
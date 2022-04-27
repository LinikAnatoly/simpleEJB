
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENPlanWork2PlanWorkReason;  	
  */

import java.io.Serializable;
import java.util.Date;


public class ENPlanWork2PlanWorkReasonShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int planRefCode = Integer.MIN_VALUE;
    public Date planRefDateGen;
    public Date planRefDateStart;
    public Date planRefDateFinal;
    public int planRefYearGen = Integer.MIN_VALUE;
    public int planRefMonthGen = Integer.MIN_VALUE;
    public int planRefYearOriginal = Integer.MIN_VALUE;
    public int planRefMonthOriginal = Integer.MIN_VALUE;
    public String planRefUserGen;
    public Date planRefDateEdit;
    public String planRefWorkOrderNumber;
    public Date planRefDateWorkOrder;
    public String planRefPriConnectionNumber;
    public int planWorkReasonRefCode = Integer.MIN_VALUE;
    public Date planWorkReasonRefDateGen;
    public String planWorkReasonRefNumberGen;
    public String planWorkReasonRefName;
    public Date planWorkReasonRefDateEdit;
    public String planWorkReasonRefUserGen;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setPlanRefCode(int aValue){
       planRefCode = aValue;
    }
    public int getPlanRefCode(){
       return planRefCode;
    }


    public void setPlanRefDateGen(Date aValue){
       planRefDateGen = aValue;
    }
    public Date getPlanRefDateGen(){
       return planRefDateGen;
    }


    public void setPlanRefDateStart(Date aValue){
       planRefDateStart = aValue;
    }
    public Date getPlanRefDateStart(){
       return planRefDateStart;
    }


    public void setPlanRefDateFinal(Date aValue){
       planRefDateFinal = aValue;
    }
    public Date getPlanRefDateFinal(){
       return planRefDateFinal;
    }

    public void setPlanRefYearGen(int aValue){
       planRefYearGen = aValue;
    }
    public int getPlanRefYearGen(){
       return planRefYearGen;
    }

    public void setPlanRefMonthGen(int aValue){
       planRefMonthGen = aValue;
    }
    public int getPlanRefMonthGen(){
       return planRefMonthGen;
    }

    public void setPlanRefYearOriginal(int aValue){
       planRefYearOriginal = aValue;
    }
    public int getPlanRefYearOriginal(){
       return planRefYearOriginal;
    }

    public void setPlanRefMonthOriginal(int aValue){
       planRefMonthOriginal = aValue;
    }
    public int getPlanRefMonthOriginal(){
       return planRefMonthOriginal;
    }

    public void setPlanRefUserGen(String aValue){
       planRefUserGen = aValue;
    }
    public String getPlanRefUserGen(){
       return planRefUserGen;
    }


    public void setPlanRefDateEdit(Date aValue){
       planRefDateEdit = aValue;
    }
    public Date getPlanRefDateEdit(){
       return planRefDateEdit;
    }

    public void setPlanRefWorkOrderNumber(String aValue){
       planRefWorkOrderNumber = aValue;
    }
    public String getPlanRefWorkOrderNumber(){
       return planRefWorkOrderNumber;
    }


    public void setPlanRefDateWorkOrder(Date aValue){
       planRefDateWorkOrder = aValue;
    }
    public Date getPlanRefDateWorkOrder(){
       return planRefDateWorkOrder;
    }

    public void setPlanRefPriConnectionNumber(String aValue){
       planRefPriConnectionNumber = aValue;
    }
    public String getPlanRefPriConnectionNumber(){
       return planRefPriConnectionNumber;
    }

    public void setPlanWorkReasonRefCode(int aValue){
       planWorkReasonRefCode = aValue;
    }
    public int getPlanWorkReasonRefCode(){
       return planWorkReasonRefCode;
    }


    public void setPlanWorkReasonRefDateGen(Date aValue){
       planWorkReasonRefDateGen = aValue;
    }
    public Date getPlanWorkReasonRefDateGen(){
       return planWorkReasonRefDateGen;
    }

    public void setPlanWorkReasonRefNumberGen(String aValue){
       planWorkReasonRefNumberGen = aValue;
    }
    public String getPlanWorkReasonRefNumberGen(){
       return planWorkReasonRefNumberGen;
    }

    public void setPlanWorkReasonRefName(String aValue){
       planWorkReasonRefName = aValue;
    }
    public String getPlanWorkReasonRefName(){
       return planWorkReasonRefName;
    }


    public void setPlanWorkReasonRefDateEdit(Date aValue){
       planWorkReasonRefDateEdit = aValue;
    }
    public Date getPlanWorkReasonRefDateEdit(){
       return planWorkReasonRefDateEdit;
    }

    public void setPlanWorkReasonRefUserGen(String aValue){
       planWorkReasonRefUserGen = aValue;
    }
    public String getPlanWorkReasonRefUserGen(){
       return planWorkReasonRefUserGen;
    }



}
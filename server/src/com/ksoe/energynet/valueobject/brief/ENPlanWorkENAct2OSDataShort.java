
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENPlanWorkENAct2OSData;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENPlanWorkENAct2OSDataShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int num_un = Integer.MIN_VALUE;
    public int num_unWriteOff = Integer.MIN_VALUE;
    public String kod_inv;
    public String kod_vid;
    public String kod_subsch_b;
    public String name_inv;
    public String kod_ist;
    public String name_ist;
    public BigDecimal sumBuhWriteOZ;
    public BigDecimal sumStCurrentN;
    public BigDecimal sumIznCurrentB;
    public BigDecimal sumIznCurrentN;
    public int typeWriteOff = Integer.MIN_VALUE;
    public String userGen;
    public Date dateEdit ;
    public int planWorkRefCode = Integer.MIN_VALUE;
    public Date planWorkRefDateGen;
    public Date planWorkRefDateStart;
    public Date planWorkRefDateFinal;
    public int planWorkRefYearGen = Integer.MIN_VALUE;
    public int planWorkRefMonthGen = Integer.MIN_VALUE;
    public int planWorkRefYearOriginal = Integer.MIN_VALUE;
    public int planWorkRefMonthOriginal = Integer.MIN_VALUE;
    public String planWorkRefUserGen;
    public Date planWorkRefDateEdit;
    public String planWorkRefWorkOrderNumber;
    public Date planWorkRefDateWorkOrder;
    public String planWorkRefPriConnectionNumber;
    public Date planWorkRefDateEndPriConnection;
    public String planWorkRefInvestWorksDescription;
    public int planWorkRefServicesFSideFinId = Integer.MIN_VALUE;
    public String planWorkRefServicesFSideCnNum;
    public BigDecimal planWorkRefTotalTimeHours;
    public BigDecimal planWorkRefTotalTimeDays;
    public String planWorkRefInvestItemNumber;
    public int actRefCode = Integer.MIN_VALUE;
    public String actRefNumberGen;
    public Date actRefDateGen;
    public int actRefFinDocCode = Integer.MIN_VALUE;
    public int actRefFinDocMechanicCode = Integer.MIN_VALUE;
    public String actRefFinMolName;
    public String actRefFinMechanicName;
    public String actRefInvNumber;
    public String actRefUserGen;
    public Date actRefDateEdit;
    public Date actRefDateAct;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setNum_un(int aValue){
       num_un = aValue;
    }

    public int getNum_un(){
       return num_un;
    }
    public void setNum_unWriteOff(int aValue){
       num_unWriteOff = aValue;
    }

    public int getNum_unWriteOff(){
       return num_unWriteOff;
    }
    public void setKod_inv(String aValue){
       kod_inv = aValue;
    }

    public String getKod_inv(){
       return kod_inv;
    }
    public void setKod_vid(String aValue){
       kod_vid = aValue;
    }

    public String getKod_vid(){
       return kod_vid;
    }
    public void setKod_subsch_b(String aValue){
       kod_subsch_b = aValue;
    }

    public String getKod_subsch_b(){
       return kod_subsch_b;
    }
    public void setName_inv(String aValue){
       name_inv = aValue;
    }

    public String getName_inv(){
       return name_inv;
    }
    public void setKod_ist(String aValue){
       kod_ist = aValue;
    }

    public String getKod_ist(){
       return kod_ist;
    }
    public void setName_ist(String aValue){
       name_ist = aValue;
    }

    public String getName_ist(){
       return name_ist;
    }
    public void setSumBuhWriteOZ(BigDecimal aValue){
       sumBuhWriteOZ = aValue;
    }

    public BigDecimal getSumBuhWriteOZ(){
       return sumBuhWriteOZ;
    }
    public void setSumStCurrentN(BigDecimal aValue){
       sumStCurrentN = aValue;
    }

    public BigDecimal getSumStCurrentN(){
       return sumStCurrentN;
    }
    public void setSumIznCurrentB(BigDecimal aValue){
       sumIznCurrentB = aValue;
    }

    public BigDecimal getSumIznCurrentB(){
       return sumIznCurrentB;
    }
    public void setSumIznCurrentN(BigDecimal aValue){
       sumIznCurrentN = aValue;
    }

    public BigDecimal getSumIznCurrentN(){
       return sumIznCurrentN;
    }
    public void setTypeWriteOff(int aValue){
       typeWriteOff = aValue;
    }

    public int getTypeWriteOff(){
       return typeWriteOff;
    }
    public void setUserGen(String aValue){
       userGen = aValue;
    }

    public String getUserGen(){
       return userGen;
    }

    public void setDateEdit(Date aValue){
       dateEdit = aValue;
    }

    public Date getDateEdit(){
       return dateEdit;
    }


    public void setPlanWorkRefCode(int aValue){
       planWorkRefCode = aValue;
    }
    public int getPlanWorkRefCode(){
       return planWorkRefCode;
    }


    public void setPlanWorkRefDateGen(Date aValue){
       planWorkRefDateGen = aValue;
    }
    public Date getPlanWorkRefDateGen(){
       return planWorkRefDateGen;
    }


    public void setPlanWorkRefDateStart(Date aValue){
       planWorkRefDateStart = aValue;
    }
    public Date getPlanWorkRefDateStart(){
       return planWorkRefDateStart;
    }


    public void setPlanWorkRefDateFinal(Date aValue){
       planWorkRefDateFinal = aValue;
    }
    public Date getPlanWorkRefDateFinal(){
       return planWorkRefDateFinal;
    }

    public void setPlanWorkRefYearGen(int aValue){
       planWorkRefYearGen = aValue;
    }
    public int getPlanWorkRefYearGen(){
       return planWorkRefYearGen;
    }

    public void setPlanWorkRefMonthGen(int aValue){
       planWorkRefMonthGen = aValue;
    }
    public int getPlanWorkRefMonthGen(){
       return planWorkRefMonthGen;
    }

    public void setPlanWorkRefYearOriginal(int aValue){
       planWorkRefYearOriginal = aValue;
    }
    public int getPlanWorkRefYearOriginal(){
       return planWorkRefYearOriginal;
    }

    public void setPlanWorkRefMonthOriginal(int aValue){
       planWorkRefMonthOriginal = aValue;
    }
    public int getPlanWorkRefMonthOriginal(){
       return planWorkRefMonthOriginal;
    }

    public void setPlanWorkRefUserGen(String aValue){
       planWorkRefUserGen = aValue;
    }
    public String getPlanWorkRefUserGen(){
       return planWorkRefUserGen;
    }


    public void setPlanWorkRefDateEdit(Date aValue){
       planWorkRefDateEdit = aValue;
    }
    public Date getPlanWorkRefDateEdit(){
       return planWorkRefDateEdit;
    }

    public void setPlanWorkRefWorkOrderNumber(String aValue){
       planWorkRefWorkOrderNumber = aValue;
    }
    public String getPlanWorkRefWorkOrderNumber(){
       return planWorkRefWorkOrderNumber;
    }


    public void setPlanWorkRefDateWorkOrder(Date aValue){
       planWorkRefDateWorkOrder = aValue;
    }
    public Date getPlanWorkRefDateWorkOrder(){
       return planWorkRefDateWorkOrder;
    }

    public void setPlanWorkRefPriConnectionNumber(String aValue){
       planWorkRefPriConnectionNumber = aValue;
    }
    public String getPlanWorkRefPriConnectionNumber(){
       return planWorkRefPriConnectionNumber;
    }


    public void setPlanWorkRefDateEndPriConnection(Date aValue){
       planWorkRefDateEndPriConnection = aValue;
    }
    public Date getPlanWorkRefDateEndPriConnection(){
       return planWorkRefDateEndPriConnection;
    }

    public void setPlanWorkRefInvestWorksDescription(String aValue){
       planWorkRefInvestWorksDescription = aValue;
    }
    public String getPlanWorkRefInvestWorksDescription(){
       return planWorkRefInvestWorksDescription;
    }

    public void setPlanWorkRefServicesFSideFinId(int aValue){
       planWorkRefServicesFSideFinId = aValue;
    }
    public int getPlanWorkRefServicesFSideFinId(){
       return planWorkRefServicesFSideFinId;
    }

    public void setPlanWorkRefServicesFSideCnNum(String aValue){
       planWorkRefServicesFSideCnNum = aValue;
    }
    public String getPlanWorkRefServicesFSideCnNum(){
       return planWorkRefServicesFSideCnNum;
    }

    public void setPlanWorkRefTotalTimeHours(BigDecimal aValue){
       planWorkRefTotalTimeHours = aValue;
    }
    public BigDecimal getPlanWorkRefTotalTimeHours(){
       return planWorkRefTotalTimeHours;
    }

    public void setPlanWorkRefTotalTimeDays(BigDecimal aValue){
       planWorkRefTotalTimeDays = aValue;
    }
    public BigDecimal getPlanWorkRefTotalTimeDays(){
       return planWorkRefTotalTimeDays;
    }

    public void setPlanWorkRefInvestItemNumber(String aValue){
       planWorkRefInvestItemNumber = aValue;
    }
    public String getPlanWorkRefInvestItemNumber(){
       return planWorkRefInvestItemNumber;
    }

    public void setActRefCode(int aValue){
       actRefCode = aValue;
    }
    public int getActRefCode(){
       return actRefCode;
    }

    public void setActRefNumberGen(String aValue){
       actRefNumberGen = aValue;
    }
    public String getActRefNumberGen(){
       return actRefNumberGen;
    }


    public void setActRefDateGen(Date aValue){
       actRefDateGen = aValue;
    }
    public Date getActRefDateGen(){
       return actRefDateGen;
    }

    public void setActRefFinDocCode(int aValue){
       actRefFinDocCode = aValue;
    }
    public int getActRefFinDocCode(){
       return actRefFinDocCode;
    }

    public void setActRefFinDocMechanicCode(int aValue){
       actRefFinDocMechanicCode = aValue;
    }
    public int getActRefFinDocMechanicCode(){
       return actRefFinDocMechanicCode;
    }

    public void setActRefFinMolName(String aValue){
       actRefFinMolName = aValue;
    }
    public String getActRefFinMolName(){
       return actRefFinMolName;
    }

    public void setActRefFinMechanicName(String aValue){
       actRefFinMechanicName = aValue;
    }
    public String getActRefFinMechanicName(){
       return actRefFinMechanicName;
    }

    public void setActRefInvNumber(String aValue){
       actRefInvNumber = aValue;
    }
    public String getActRefInvNumber(){
       return actRefInvNumber;
    }

    public void setActRefUserGen(String aValue){
       actRefUserGen = aValue;
    }
    public String getActRefUserGen(){
       return actRefUserGen;
    }


    public void setActRefDateEdit(Date aValue){
       actRefDateEdit = aValue;
    }
    public Date getActRefDateEdit(){
       return actRefDateEdit;
    }


    public void setActRefDateAct(Date aValue){
       actRefDateAct = aValue;
    }
    public Date getActRefDateAct(){
       return actRefDateAct;
    }



}
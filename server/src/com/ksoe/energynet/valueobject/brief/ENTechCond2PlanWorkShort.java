
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTechCond2PlanWork;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENTechCond2PlanWorkShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int techConServicesRefCode = Integer.MIN_VALUE;
    public String techConServicesRefContractNumber;
    public Date techConServicesRefContractDate;
    public String techConServicesRefFinContractNumber;
    public Date techConServicesRefFinContractDate;
    public String techConServicesRefPartnerName;
    public String techConServicesRefPartnerCode;
    public String techConServicesRefFinDocCode;
    public int techConServicesRefFinDocID = Integer.MIN_VALUE;
    public String techConServicesRefFinCommentGen;
    public BigDecimal techConServicesRefTySummaGen;
    public BigDecimal techConServicesRefTySummaVat;
    public BigDecimal techConServicesRefTyServicesSumma;
    public BigDecimal techConServicesRefTyServicesPower;
    public String techConServicesRefCommentServicesGen;
    public String techConServicesRefUserGen;
    public Date techConServicesRefDateEdit;
    public int techConServicesRefCnPackCode = Integer.MIN_VALUE;
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
    public int planRefServicesFSideFinId = Integer.MIN_VALUE;
    public String planRefServicesFSideCnNum;
    public BigDecimal planRefTotaltimehours;
    public BigDecimal planRefTotaltimedays;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }


    public void setTechConServicesRefCode(int aValue){
       techConServicesRefCode = aValue;
    }
    public int getTechConServicesRefCode(){
       return techConServicesRefCode;
    }

    public void setTechConServicesRefContractNumber(String aValue){
       techConServicesRefContractNumber = aValue;
    }
    public String getTechConServicesRefContractNumber(){
       return techConServicesRefContractNumber;
    }


    public void setTechConServicesRefContractDate(Date aValue){
       techConServicesRefContractDate = aValue;
    }
    public Date getTechConServicesRefContractDate(){
       return techConServicesRefContractDate;
    }

    public void setTechConServicesRefFinContractNumber(String aValue){
       techConServicesRefFinContractNumber = aValue;
    }
    public String getTechConServicesRefFinContractNumber(){
       return techConServicesRefFinContractNumber;
    }


    public void setTechConServicesRefFinContractDate(Date aValue){
       techConServicesRefFinContractDate = aValue;
    }
    public Date getTechConServicesRefFinContractDate(){
       return techConServicesRefFinContractDate;
    }

    public void setTechConServicesRefPartnerName(String aValue){
       techConServicesRefPartnerName = aValue;
    }
    public String getTechConServicesRefPartnerName(){
       return techConServicesRefPartnerName;
    }

    public void setTechConServicesRefPartnerCode(String aValue){
       techConServicesRefPartnerCode = aValue;
    }
    public String getTechConServicesRefPartnerCode(){
       return techConServicesRefPartnerCode;
    }

    public void setTechConServicesRefFinDocCode(String aValue){
       techConServicesRefFinDocCode = aValue;
    }
    public String getTechConServicesRefFinDocCode(){
       return techConServicesRefFinDocCode;
    }

    public void setTechConServicesRefFinDocID(int aValue){
       techConServicesRefFinDocID = aValue;
    }
    public int getTechConServicesRefFinDocID(){
       return techConServicesRefFinDocID;
    }

    public void setTechConServicesRefFinCommentGen(String aValue){
       techConServicesRefFinCommentGen = aValue;
    }
    public String getTechConServicesRefFinCommentGen(){
       return techConServicesRefFinCommentGen;
    }

    public void setTechConServicesRefTySummaGen(BigDecimal aValue){
       techConServicesRefTySummaGen = aValue;
    }
    public BigDecimal getTechConServicesRefTySummaGen(){
       return techConServicesRefTySummaGen;
    }

    public void setTechConServicesRefTySummaVat(BigDecimal aValue){
       techConServicesRefTySummaVat = aValue;
    }
    public BigDecimal getTechConServicesRefTySummaVat(){
       return techConServicesRefTySummaVat;
    }

    public void setTechConServicesRefTyServicesSumma(BigDecimal aValue){
       techConServicesRefTyServicesSumma = aValue;
    }
    public BigDecimal getTechConServicesRefTyServicesSumma(){
       return techConServicesRefTyServicesSumma;
    }

    public void setTechConServicesRefTyServicesPower(BigDecimal aValue){
       techConServicesRefTyServicesPower = aValue;
    }
    public BigDecimal getTechConServicesRefTyServicesPower(){
       return techConServicesRefTyServicesPower;
    }

    public void setTechConServicesRefCommentServicesGen(String aValue){
       techConServicesRefCommentServicesGen = aValue;
    }
    public String getTechConServicesRefCommentServicesGen(){
       return techConServicesRefCommentServicesGen;
    }

    public void setTechConServicesRefUserGen(String aValue){
       techConServicesRefUserGen = aValue;
    }
    public String getTechConServicesRefUserGen(){
       return techConServicesRefUserGen;
    }


    public void setTechConServicesRefDateEdit(Date aValue){
       techConServicesRefDateEdit = aValue;
    }
    public Date getTechConServicesRefDateEdit(){
       return techConServicesRefDateEdit;
    }

    public void setTechConServicesRefCnPackCode(int aValue){
       techConServicesRefCnPackCode = aValue;
    }
    public int getTechConServicesRefCnPackCode(){
       return techConServicesRefCnPackCode;
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

    public void setPlanRefServicesFSideFinId(int aValue){
       planRefServicesFSideFinId = aValue;
    }
    public int getPlanRefServicesFSideFinId(){
       return planRefServicesFSideFinId;
    }

    public void setPlanRefServicesFSideCnNum(String aValue){
       planRefServicesFSideCnNum = aValue;
    }
    public String getPlanRefServicesFSideCnNum(){
       return planRefServicesFSideCnNum;
    }

    public void setPlanRefTotaltimehours(BigDecimal aValue){
       planRefTotaltimehours = aValue;
    }
    public BigDecimal getPlanRefTotaltimehours(){
       return planRefTotaltimehours;
    }

    public void setPlanRefTotaltimedays(BigDecimal aValue){
       planRefTotaltimedays = aValue;
    }
    public BigDecimal getPlanRefTotaltimedays(){
       return planRefTotaltimedays;
    }



}
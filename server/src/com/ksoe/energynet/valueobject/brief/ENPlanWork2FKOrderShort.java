
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENPlanWork2FKOrder;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENPlanWork2FKOrderShort implements Serializable {

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
    public int fkOrderRefCode = Integer.MIN_VALUE;
    public String fkOrderRefNumberDoc;
    public Date fkOrderRefDateGen;
    public Date fkOrderRefDateShipment;
    public String fkOrderRefMolOutCode;
    public String fkOrderRefMolOutName;
    public String fkOrderRefMolInCode;
    public String fkOrderRefMolInName;
    public String fkOrderRefExpeditorCode;
    public String fkOrderRefExpeditorName;
    public String fkOrderRefWarrantNumber;
    public Date fkOrderRefWarrantDate;
    public String fkOrderRefWarrantFIO;
    public BigDecimal fkOrderRefSumWithoutNds;
    public BigDecimal fkOrderRefSumNds;
    public int fkOrderRefNdsPercent = Integer.MIN_VALUE;
    public Date fkOrderRefDateAdd;
    public String fkOrderRefUserAdd;
    public Date fkOrderRefDateEdit;
    public String fkOrderRefUserGen;

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

    public void setFkOrderRefCode(int aValue){
       fkOrderRefCode = aValue;
    }
    public int getFkOrderRefCode(){
       return fkOrderRefCode;
    }

    public void setFkOrderRefNumberDoc(String aValue){
       fkOrderRefNumberDoc = aValue;
    }
    public String getFkOrderRefNumberDoc(){
       return fkOrderRefNumberDoc;
    }


    public void setFkOrderRefDateGen(Date aValue){
       fkOrderRefDateGen = aValue;
    }
    public Date getFkOrderRefDateGen(){
       return fkOrderRefDateGen;
    }


    public void setFkOrderRefDateShipment(Date aValue){
       fkOrderRefDateShipment = aValue;
    }
    public Date getFkOrderRefDateShipment(){
       return fkOrderRefDateShipment;
    }

    public void setFkOrderRefMolOutCode(String aValue){
       fkOrderRefMolOutCode = aValue;
    }
    public String getFkOrderRefMolOutCode(){
       return fkOrderRefMolOutCode;
    }

    public void setFkOrderRefMolOutName(String aValue){
       fkOrderRefMolOutName = aValue;
    }
    public String getFkOrderRefMolOutName(){
       return fkOrderRefMolOutName;
    }

    public void setFkOrderRefMolInCode(String aValue){
       fkOrderRefMolInCode = aValue;
    }
    public String getFkOrderRefMolInCode(){
       return fkOrderRefMolInCode;
    }

    public void setFkOrderRefMolInName(String aValue){
       fkOrderRefMolInName = aValue;
    }
    public String getFkOrderRefMolInName(){
       return fkOrderRefMolInName;
    }

    public void setFkOrderRefExpeditorCode(String aValue){
       fkOrderRefExpeditorCode = aValue;
    }
    public String getFkOrderRefExpeditorCode(){
       return fkOrderRefExpeditorCode;
    }

    public void setFkOrderRefExpeditorName(String aValue){
       fkOrderRefExpeditorName = aValue;
    }
    public String getFkOrderRefExpeditorName(){
       return fkOrderRefExpeditorName;
    }

    public void setFkOrderRefWarrantNumber(String aValue){
       fkOrderRefWarrantNumber = aValue;
    }
    public String getFkOrderRefWarrantNumber(){
       return fkOrderRefWarrantNumber;
    }


    public void setFkOrderRefWarrantDate(Date aValue){
       fkOrderRefWarrantDate = aValue;
    }
    public Date getFkOrderRefWarrantDate(){
       return fkOrderRefWarrantDate;
    }

    public void setFkOrderRefWarrantFIO(String aValue){
       fkOrderRefWarrantFIO = aValue;
    }
    public String getFkOrderRefWarrantFIO(){
       return fkOrderRefWarrantFIO;
    }

    public void setFkOrderRefSumWithoutNds(BigDecimal aValue){
       fkOrderRefSumWithoutNds = aValue;
    }
    public BigDecimal getFkOrderRefSumWithoutNds(){
       return fkOrderRefSumWithoutNds;
    }

    public void setFkOrderRefSumNds(BigDecimal aValue){
       fkOrderRefSumNds = aValue;
    }
    public BigDecimal getFkOrderRefSumNds(){
       return fkOrderRefSumNds;
    }

    public void setFkOrderRefNdsPercent(int aValue){
       fkOrderRefNdsPercent = aValue;
    }
    public int getFkOrderRefNdsPercent(){
       return fkOrderRefNdsPercent;
    }


    public void setFkOrderRefDateAdd(Date aValue){
       fkOrderRefDateAdd = aValue;
    }
    public Date getFkOrderRefDateAdd(){
       return fkOrderRefDateAdd;
    }

    public void setFkOrderRefUserAdd(String aValue){
       fkOrderRefUserAdd = aValue;
    }
    public String getFkOrderRefUserAdd(){
       return fkOrderRefUserAdd;
    }


    public void setFkOrderRefDateEdit(Date aValue){
       fkOrderRefDateEdit = aValue;
    }
    public Date getFkOrderRefDateEdit(){
       return fkOrderRefDateEdit;
    }

    public void setFkOrderRefUserGen(String aValue){
       fkOrderRefUserGen = aValue;
    }
    public String getFkOrderRefUserGen(){
       return fkOrderRefUserGen;
    }



}

//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTransportRoute2RQFKOrder;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENTransportRoute2RQFKOrderShort implements Serializable {

    public int code = Integer.MIN_VALUE;
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
    public int transportRouteRefCode = Integer.MIN_VALUE;
    public BigDecimal transportRouteRefDistance;
    public BigDecimal transportRouteRefWeight;
    public Date transportRouteRefDateEdit;
    public String transportRouteRefUserGen;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
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

    public void setTransportRouteRefCode(int aValue){
       transportRouteRefCode = aValue;
    }
    public int getTransportRouteRefCode(){
       return transportRouteRefCode;
    }

    public void setTransportRouteRefDistance(BigDecimal aValue){
       transportRouteRefDistance = aValue;
    }
    public BigDecimal getTransportRouteRefDistance(){
       return transportRouteRefDistance;
    }

    public void setTransportRouteRefWeight(BigDecimal aValue){
       transportRouteRefWeight = aValue;
    }
    public BigDecimal getTransportRouteRefWeight(){
       return transportRouteRefWeight;
    }


    public void setTransportRouteRefDateEdit(Date aValue){
       transportRouteRefDateEdit = aValue;
    }
    public Date getTransportRouteRefDateEdit(){
       return transportRouteRefDateEdit;
    }

    public void setTransportRouteRefUserGen(String aValue){
       transportRouteRefUserGen = aValue;
    }
    public String getTransportRouteRefUserGen(){
       return transportRouteRefUserGen;
    }



}

//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENActInTechCond2ENAct;  	
  */

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;


public class ENActInTechCond2ENActShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal summaGen;
    public int actIncomeRefCode = Integer.MIN_VALUE;
    public String actIncomeRefNumbergen;
    public Date actIncomeRefDategen;
    public Date actIncomeRefActDateStart;
    public Date actIncomeRefActDateEnd;
    public BigDecimal actIncomeRefSummaGen;
    public BigDecimal actIncomeRefSummaVat;
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
    public void setSummaGen(BigDecimal aValue){
       summaGen = aValue;
    }

    public BigDecimal getSummaGen(){
       return summaGen;
    }


    public void setActIncomeRefCode(int aValue){
       actIncomeRefCode = aValue;
    }
    public int getActIncomeRefCode(){
       return actIncomeRefCode;
    }

    public void setActIncomeRefNumbergen(String aValue){
       actIncomeRefNumbergen = aValue;
    }
    public String getActIncomeRefNumbergen(){
       return actIncomeRefNumbergen;
    }


    public void setActIncomeRefDategen(Date aValue){
       actIncomeRefDategen = aValue;
    }
    public Date getActIncomeRefDategen(){
       return actIncomeRefDategen;
    }


    public void setActIncomeRefActDateStart(Date aValue){
       actIncomeRefActDateStart = aValue;
    }
    public Date getActIncomeRefActDateStart(){
       return actIncomeRefActDateStart;
    }


    public void setActIncomeRefActDateEnd(Date aValue){
       actIncomeRefActDateEnd = aValue;
    }
    public Date getActIncomeRefActDateEnd(){
       return actIncomeRefActDateEnd;
    }

    public void setActIncomeRefSummaGen(BigDecimal aValue){
       actIncomeRefSummaGen = aValue;
    }
    public BigDecimal getActIncomeRefSummaGen(){
       return actIncomeRefSummaGen;
    }

    public void setActIncomeRefSummaVat(BigDecimal aValue){
       actIncomeRefSummaVat = aValue;
    }
    public BigDecimal getActIncomeRefSummaVat(){
       return actIncomeRefSummaVat;
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
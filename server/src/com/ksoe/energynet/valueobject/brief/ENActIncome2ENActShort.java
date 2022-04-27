
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENActIncome2ENAct;  	
  */

import java.io.Serializable;
import java.util.Date;


public class ENActIncome2ENActShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public int actIncomeRefCode = Integer.MIN_VALUE;
    public String actIncomeRefNumbergen;
    public Date actIncomeRefDategen;
    public String actIncomeRefContractNumber;
    public Date actIncomeRefContractDate;
    public String actIncomeRefPartnername;
    public String actIncomeRefPartnerCode;
    public String actIncomeRefFinDocCode;
    public int actIncomeRefFinDocID = Integer.MIN_VALUE;
    public int actRefCode = Integer.MIN_VALUE;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
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

    public void setActIncomeRefContractNumber(String aValue){
       actIncomeRefContractNumber = aValue;
    }
    public String getActIncomeRefContractNumber(){
       return actIncomeRefContractNumber;
    }


    public void setActIncomeRefContractDate(Date aValue){
       actIncomeRefContractDate = aValue;
    }
    public Date getActIncomeRefContractDate(){
       return actIncomeRefContractDate;
    }

    public void setActIncomeRefPartnername(String aValue){
       actIncomeRefPartnername = aValue;
    }
    public String getActIncomeRefPartnername(){
       return actIncomeRefPartnername;
    }

    public void setActIncomeRefPartnerCode(String aValue){
       actIncomeRefPartnerCode = aValue;
    }
    public String getActIncomeRefPartnerCode(){
       return actIncomeRefPartnerCode;
    }

    public void setActIncomeRefFinDocCode(String aValue){
       actIncomeRefFinDocCode = aValue;
    }
    public String getActIncomeRefFinDocCode(){
       return actIncomeRefFinDocCode;
    }

    public void setActIncomeRefFinDocID(int aValue){
       actIncomeRefFinDocID = aValue;
    }
    public int getActIncomeRefFinDocID(){
       return actIncomeRefFinDocID;
    }
    public void setActRefCode(int aValue){
       actRefCode = aValue;
    }
    public int getActRefCode(){
       return actRefCode;
    }




}
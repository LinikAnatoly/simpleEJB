
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for SCUsageInputItem;  	
  */

import java.io.Serializable;
import java.util.Date;


public class SCUsageInputItemShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String numberDoc;
    public int countGen = Integer.MIN_VALUE;
    public int scCode = Integer.MIN_VALUE;
    public String molCode;
    public String molName;
    public int usageInputRefCode = Integer.MIN_VALUE;
    public String usageInputRefNumberDoc;
    public Date usageInputRefDateGen;
    public Date usageInputRefDateStart;
    public Date usageInputRefDateFinal;
    public String usageInputRefMolCode;
    public String usageInputRefMolName;
    public Date usageInputRefDateEdit;
    public String usageInputRefUserGen;
    public int kindRefCode = Integer.MIN_VALUE;
    public String kindRefName;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setNumberDoc(String aValue){
       numberDoc = aValue;
    }

    public String getNumberDoc(){
       return numberDoc;
    }
    public void setCountGen(int aValue){
       countGen = aValue;
    }

    public int getCountGen(){
       return countGen;
    }
    public void setScCode(int aValue){
       scCode = aValue;
    }

    public int getScCode(){
       return scCode;
    }
    public void setMolCode(String aValue){
       molCode = aValue;
    }

    public String getMolCode(){
       return molCode;
    }
    public void setMolName(String aValue){
       molName = aValue;
    }

    public String getMolName(){
       return molName;
    }


    public void setUsageInputRefCode(int aValue){
       usageInputRefCode = aValue;
    }
    public int getUsageInputRefCode(){
       return usageInputRefCode;
    }

    public void setUsageInputRefNumberDoc(String aValue){
       usageInputRefNumberDoc = aValue;
    }
    public String getUsageInputRefNumberDoc(){
       return usageInputRefNumberDoc;
    }


    public void setUsageInputRefDateGen(Date aValue){
       usageInputRefDateGen = aValue;
    }
    public Date getUsageInputRefDateGen(){
       return usageInputRefDateGen;
    }


    public void setUsageInputRefDateStart(Date aValue){
       usageInputRefDateStart = aValue;
    }
    public Date getUsageInputRefDateStart(){
       return usageInputRefDateStart;
    }


    public void setUsageInputRefDateFinal(Date aValue){
       usageInputRefDateFinal = aValue;
    }
    public Date getUsageInputRefDateFinal(){
       return usageInputRefDateFinal;
    }

    public void setUsageInputRefMolCode(String aValue){
       usageInputRefMolCode = aValue;
    }
    public String getUsageInputRefMolCode(){
       return usageInputRefMolCode;
    }

    public void setUsageInputRefMolName(String aValue){
       usageInputRefMolName = aValue;
    }
    public String getUsageInputRefMolName(){
       return usageInputRefMolName;
    }


    public void setUsageInputRefDateEdit(Date aValue){
       usageInputRefDateEdit = aValue;
    }
    public Date getUsageInputRefDateEdit(){
       return usageInputRefDateEdit;
    }

    public void setUsageInputRefUserGen(String aValue){
       usageInputRefUserGen = aValue;
    }
    public String getUsageInputRefUserGen(){
       return usageInputRefUserGen;
    }

    public void setKindRefCode(int aValue){
       kindRefCode = aValue;
    }
    public int getKindRefCode(){
       return kindRefCode;
    }

    public void setKindRefName(String aValue){
       kindRefName = aValue;
    }
    public String getKindRefName(){
       return kindRefName;
    }



}
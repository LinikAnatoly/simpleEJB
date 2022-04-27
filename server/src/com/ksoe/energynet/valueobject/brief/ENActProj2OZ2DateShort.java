
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENActProj2OZ2Date;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENActProj2OZ2DateShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public Date dateGen ;
    public int ENActProjRefCode = Integer.MIN_VALUE;
    public String ENActProjRefNumberGen;
    public Date ENActProjRefDateGen;
    public BigDecimal ENActProjRefSummaGen;
    public String ENActProjRefUserGen;
    public Date ENActProjRefDateEdit;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }

    public void setDateGen(Date aValue){
       dateGen = aValue;
    }

    public Date getDateGen(){
       return dateGen;
    }


    public void setENActProjRefCode(int aValue){
       ENActProjRefCode = aValue;
    }
    public int getENActProjRefCode(){
       return ENActProjRefCode;
    }

    public void setENActProjRefNumberGen(String aValue){
       ENActProjRefNumberGen = aValue;
    }
    public String getENActProjRefNumberGen(){
       return ENActProjRefNumberGen;
    }


    public void setENActProjRefDateGen(Date aValue){
       ENActProjRefDateGen = aValue;
    }
    public Date getENActProjRefDateGen(){
       return ENActProjRefDateGen;
    }

    public void setENActProjRefSummaGen(BigDecimal aValue){
       ENActProjRefSummaGen = aValue;
    }
    public BigDecimal getENActProjRefSummaGen(){
       return ENActProjRefSummaGen;
    }

    public void setENActProjRefUserGen(String aValue){
       ENActProjRefUserGen = aValue;
    }
    public String getENActProjRefUserGen(){
       return ENActProjRefUserGen;
    }


    public void setENActProjRefDateEdit(Date aValue){
       ENActProjRefDateEdit = aValue;
    }
    public Date getENActProjRefDateEdit(){
       return ENActProjRefDateEdit;
    }



}

//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENManningTable2TKPosition;  	
  */

import java.io.Serializable;
import java.util.Date;


public class ENManningTable2TKPositionShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public int manningTableRefCode = Integer.MIN_VALUE; 
    public String manningTableRefName; 
    public Date manningTableRefDateStart; 
    public Date manningTableRefDateFinal; 
    public int tkpositionRefCode = Integer.MIN_VALUE; 
    public String tkpositionRefName; 
    public String tkpositionRefSafetyGroup; 
    public String tkpositionRefRank; 
    public String tkpositionRefShortName; 


    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	

    public void setManningTableRefCode(int aValue){
       manningTableRefCode = aValue;
    }
    public int getManningTableRefCode(){
       return manningTableRefCode;
    }
	
    public void setManningTableRefName(String aValue){
       manningTableRefName = aValue;
    }
    public String getManningTableRefName(){
       return manningTableRefName;
    }
	
    public void setManningTableRefDateStart(Date aValue){
       manningTableRefDateStart = aValue;
    }
    public Date getManningTableRefDateStart(){
       return manningTableRefDateStart;
    }
	
    public void setManningTableRefDateFinal(Date aValue){
       manningTableRefDateFinal = aValue;
    }
    public Date getManningTableRefDateFinal(){
       return manningTableRefDateFinal;
    }
	
    public void setTkpositionRefCode(int aValue){
       tkpositionRefCode = aValue;
    }
    public int getTkpositionRefCode(){
       return tkpositionRefCode;
    }
	
    public void setTkpositionRefName(String aValue){
       tkpositionRefName = aValue;
    }
    public String getTkpositionRefName(){
       return tkpositionRefName;
    }
	
    public void setTkpositionRefSafetyGroup(String aValue){
       tkpositionRefSafetyGroup = aValue;
    }
    public String getTkpositionRefSafetyGroup(){
       return tkpositionRefSafetyGroup;
    }
	
    public void setTkpositionRefRank(String aValue){
       tkpositionRefRank = aValue;
    }
    public String getTkpositionRefRank(){
       return tkpositionRefRank;
    }
	
    public void setTkpositionRefShortName(String aValue){
       tkpositionRefShortName = aValue;
    }
    public String getTkpositionRefShortName(){
       return tkpositionRefShortName;
    }
	



}
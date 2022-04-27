
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENWorker;  	
  */

import java.io.Serializable;
import java.util.Date;


public class ENWorkerShort implements Serializable {

    public int code = Integer.MIN_VALUE; 
    public String name; 
    public String tabNumber; 
    public int isMol = Integer.MIN_VALUE; 
    public int manningTableCode = Integer.MIN_VALUE; 
    public String manningTableName; 
    public Date manningTableDateStart; 
    public Date manningTableDateFinal; 


    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	
    public void setName(String aValue){
       name = aValue;
    }
    public String getName(){
       return name;
    }
	
    public void setTabNumber(String aValue){
       tabNumber = aValue;
    }
    public String getTabNumber(){
       return tabNumber;
    }
	
    public void setIsMol(int aValue){
       isMol = aValue;
    }
    public int getIsMol(){
       return isMol;
    }
	

    public void setManningTableCode(int aValue){
       manningTableCode = aValue;
    }
    public int getManningTableCode(){
       return manningTableCode;
    }
	
    public void setManningTableName(String aValue){
       manningTableName = aValue;
    }
    public String getManningTableName(){
       return manningTableName;
    }
	
    public void setManningTableDateStart(Date aValue){
       manningTableDateStart = aValue;
    }
    public Date getManningTableDateStart(){
       return manningTableDateStart;
    }
	
    public void setManningTableDateFinal(Date aValue){
       manningTableDateFinal = aValue;
    }
    public Date getManningTableDateFinal(){
       return manningTableDateFinal;
    }
	



}
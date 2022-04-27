
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENMetrologyObject;  	
  */

import java.io.Serializable;


public class ENMetrologyObjectShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String name;
    public int is3phase = Integer.MIN_VALUE;
    public int isElectron = Integer.MIN_VALUE;
    public int elementCode = Integer.MIN_VALUE;

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
    public void setIs3phase(int aValue){
       is3phase = aValue;
    }

    public int getIs3phase(){
       return is3phase;
    }
    public void setIsElectron(int aValue){
       isElectron = aValue;
    }

    public int getIsElectron(){
       return isElectron;
    }

    public void setElementCode(int aValue){
       elementCode = aValue;
    }
    public int getElementCode(){
       return elementCode;
    }




}
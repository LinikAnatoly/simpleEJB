
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENTiresInstallPlaces;  	
  */

import java.io.Serializable;


public class ENTiresInstallPlacesShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String name;

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




}
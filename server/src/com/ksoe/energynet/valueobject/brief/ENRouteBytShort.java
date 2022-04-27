
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENRouteByt;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENRouteBytShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public String name;
    public String numbergen;
    public int routeCode = Integer.MIN_VALUE;
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
    public void setNumbergen(String aValue){
       numbergen = aValue;
    }

    public String getNumbergen(){
       return numbergen;
    }
    public void setRouteCode(int aValue){
       routeCode = aValue;
    }

    public int getRouteCode(){
       return routeCode;
    }

    public void setElementCode(int aValue){
       elementCode = aValue;
    }
    public int getElementCode(){
       return elementCode;
    }




}
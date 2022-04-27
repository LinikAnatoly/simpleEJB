
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.brief;



  /**
  * Short Object for ENDestinationPoint2Point;  	
  */

import java.math.BigDecimal;
import java.util.Date;
import java.io.Serializable;


public class ENDestinationPoint2PointShort implements Serializable {

    public int code = Integer.MIN_VALUE;
    public BigDecimal distance;
    public int elementInRefCode = Integer.MIN_VALUE;
    public int elementOutRefCode = Integer.MIN_VALUE;

    public void setCode(int aValue){
       code = aValue;
    }

    public int getCode(){
       return code;
    }
    public void setDistance(BigDecimal aValue){
       distance = aValue;
    }

    public BigDecimal getDistance(){
       return distance;
    }


    public void setElementInRefCode(int aValue){
       elementInRefCode = aValue;
    }
    public int getElementInRefCode(){
       return elementInRefCode;
    }

    public void setElementOutRefCode(int aValue){
       elementOutRefCode = aValue;
    }
    public int getElementOutRefCode(){
       return elementOutRefCode;
    }



}
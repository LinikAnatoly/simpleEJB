
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.references;

  /**
  * References for SCUsageInputItemOZ2SCCounter;  	
  */

import java.io.Serializable;


public class SCUsageInputItemOZ2SCCounterRef implements Serializable
{
    public int code = Integer.MIN_VALUE; 

  public static final String className = "com.ksoe.energynet.valueobject.SCUsageInputItemOZ2SCCounter";

    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	



} // end of SCUsageInputItemOZ2SCCounterRef



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.references;

  /**
  * References for ENEstimateItemKind;  	
  */

import java.io.Serializable;


public class ENEstimateItemKindRef implements Serializable
{
    public int code = Integer.MIN_VALUE; 

  public static final String className = "com.ksoe.energynet.valueobject.ENEstimateItemKind";

    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	



} // end of ENEstimateItemKindRef


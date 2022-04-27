
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.references;

  /**
  * References for ENCheckpoint;  	
  */

import java.io.Serializable;


public class ENCheckpointRef implements Serializable
{
    public int code = Integer.MIN_VALUE; 

  public static final String className = "com.ksoe.energynet.valueobject.ENCheckpoint";

    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	



} // end of ENCheckpointRef



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.references;

  /**
  * References for ENMOLSTOREKEEPER2PlanWork;  	
  */

import java.io.Serializable;


public class ENMOLSTOREKEEPER2PlanWorkRef implements Serializable
{
    public int code = Integer.MIN_VALUE; 

  public static final String className = "com.ksoe.energynet.valueobject.ENMOLSTOREKEEPER2PlanWork";

    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	



} // end of ENMOLSTOREKEEPER2PlanWorkRef



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.references;

  /**
  * References for ENSizObject;
  */

import java.io.Serializable;


public class ENSizObjectRef implements Serializable
{
    public int code = Integer.MIN_VALUE;

  public static final String className = "com.ksoe.energynet.valueobject.ENSizObject";

    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }

} // end of ENSizObjectRef


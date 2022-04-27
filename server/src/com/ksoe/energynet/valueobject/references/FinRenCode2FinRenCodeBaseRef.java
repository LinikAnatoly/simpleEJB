
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.references;

  /**
  * References for FinRenCode2FinRenCodeBase;  	
  */

import java.io.Serializable;


public class FinRenCode2FinRenCodeBaseRef implements Serializable
{
    public int code = Integer.MIN_VALUE; 

  public static final String className = "com.ksoe.energynet.valueobject.FinRenCode2FinRenCodeBase";

    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	



} // end of FinRenCode2FinRenCodeBaseRef


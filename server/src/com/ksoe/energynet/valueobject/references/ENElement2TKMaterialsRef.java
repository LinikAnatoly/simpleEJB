
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2014 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.references;

  /**
  * References for ENElement2TKMaterials;  	
  */

import java.io.Serializable;


public class ENElement2TKMaterialsRef implements Serializable
{
    public int code = Integer.MIN_VALUE; 

  public static final String className = "com.ksoe.energynet.valueobject.ENElement2TKMaterials";

    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	



} // end of ENElement2TKMaterialsRef


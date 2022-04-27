
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.references;

  /**
  * References for RegulatoryAssetBaseOutOfUse;  	
  */

import java.io.Serializable;


public class RegulatoryAssetBaseOutOfUseRef implements Serializable
{
    public int code = Integer.MIN_VALUE; 

  public static final String className = "com.ksoe.energynet.valueobject.RegulatoryAssetBaseOutOfUse";

    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	



} // end of RegulatoryAssetBaseOutOfUseRef


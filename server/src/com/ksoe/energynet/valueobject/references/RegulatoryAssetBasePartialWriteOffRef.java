
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.references;

  /**
  * References for RegulatoryAssetBasePartialWriteOff;  	
  */

import java.io.Serializable;


public class RegulatoryAssetBasePartialWriteOffRef implements Serializable
{
    public int code = Integer.MIN_VALUE; 

  public static final String className = "com.ksoe.energynet.valueobject.RegulatoryAssetBasePartialWriteOff";

    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	



} // end of RegulatoryAssetBasePartialWriteOffRef



//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.references;

  /**
  * References for ENBuildingCommissionType;  	
  */

import java.io.Serializable;


public class ENBuildingCommissionTypeRef implements Serializable
{
    public int code = Integer.MIN_VALUE; 

  public static final String className = "com.ksoe.energynet.valueobject.ENBuildingCommissionType";

    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	



} // end of ENBuildingCommissionTypeRef



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------

package  com.ksoe.energynet.valueobject.references;

  /**
  * References for ENPlanWorkItem2PlanWorkItemType;  	
  */

import java.io.Serializable;


public class ENPlanWorkItem2PlanWorkItemTypeRef implements Serializable
{
    public int code = Integer.MIN_VALUE; 

  public static final String className = "com.ksoe.energynet.valueobject.ENPlanWorkItem2PlanWorkItemType";

    public void setCode(int aValue){
       code = aValue;
    }
    public int getCode(){
       return code;
    }
	



} // end of ENPlanWorkItem2PlanWorkItemTypeRef


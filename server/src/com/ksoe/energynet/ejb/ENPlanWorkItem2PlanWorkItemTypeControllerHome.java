
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENPlanWorkItem2PlanWorkItemType;  
  * 	
  */
  

public interface ENPlanWorkItem2PlanWorkItemTypeControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENPlanWorkItem2PlanWorkItemTypeController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENPlanWorkItem2PlanWorkItem;  
  * 	
  */
  

public interface ENPlanWorkItem2PlanWorkItemControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENPlanWorkItem2PlanWorkItemController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


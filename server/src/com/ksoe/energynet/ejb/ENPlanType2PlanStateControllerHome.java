
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENPlanType2PlanState;  
  * 	
  */
  

public interface ENPlanType2PlanStateControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENPlanType2PlanStateController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


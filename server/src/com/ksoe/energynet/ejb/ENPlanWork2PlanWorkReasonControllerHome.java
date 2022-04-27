
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENPlanWork2PlanWorkReason;  
  * 	
  */
  

public interface ENPlanWork2PlanWorkReasonControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENPlanWork2PlanWorkReasonController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


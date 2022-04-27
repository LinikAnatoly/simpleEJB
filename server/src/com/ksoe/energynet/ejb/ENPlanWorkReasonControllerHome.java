
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENPlanWorkReason;  
  * 	
  */
  

public interface ENPlanWorkReasonControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENPlanWorkReasonController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENPlanWorkReasonType;  
  * 	
  */
  

public interface ENPlanWorkReasonTypeControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENPlanWorkReasonTypeController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for SCCounterStatus;  
  * 	
  */
  

public interface SCCounterStatusControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.SCCounterStatusController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for FINExecutorType;  
  * 	
  */
  

public interface FINExecutorTypeControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.FINExecutorTypeController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


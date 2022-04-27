
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for FINExecutor;  
  * 	
  */
  

public interface FINExecutorControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.FINExecutorController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


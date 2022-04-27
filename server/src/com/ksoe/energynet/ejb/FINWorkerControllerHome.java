
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for FINWorker;  
  * 	
  */
  

public interface FINWorkerControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.FINWorkerController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


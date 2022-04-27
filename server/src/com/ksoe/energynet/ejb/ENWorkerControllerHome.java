
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENWorker;  
  * 	
  */
  

public interface ENWorkerControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENWorkerController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


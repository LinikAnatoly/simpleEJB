
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for FINContracts;  
  * 	
  */
  

public interface FINContractsControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.FINContractsController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


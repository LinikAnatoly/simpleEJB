
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENResponsibles2FINContracts;  
  * 	
  */
  

public interface ENResponsibles2FINContractsControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENResponsibles2FINContractsController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


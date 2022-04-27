
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENServicesObjectStatus;  
  * 	
  */
  

public interface ENServicesObjectStatusControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENServicesObjectStatusController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


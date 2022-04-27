
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENMolStatus;  
  * 	
  */
  

public interface ENMolStatusControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENMolStatusController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


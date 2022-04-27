
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTiresInstallStatus;  
  * 	
  */
  

public interface ENTiresInstallStatusControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTiresInstallStatusController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


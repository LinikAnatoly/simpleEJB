
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTiresInstallPlaces;  
  * 	
  */
  

public interface ENTiresInstallPlacesControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTiresInstallPlacesController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


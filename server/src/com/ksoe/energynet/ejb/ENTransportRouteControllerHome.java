
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTransportRoute;  
  * 	
  */
  

public interface ENTransportRouteControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTransportRouteController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


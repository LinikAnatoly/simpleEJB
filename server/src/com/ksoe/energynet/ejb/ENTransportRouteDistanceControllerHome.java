
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTransportRouteDistance;  
  * 	
  */
  

public interface ENTransportRouteDistanceControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTransportRouteDistanceController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


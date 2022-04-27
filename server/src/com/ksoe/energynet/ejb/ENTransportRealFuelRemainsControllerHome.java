
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTransportRealFuelRemains;  
  * 	
  */
  

public interface ENTransportRealFuelRemainsControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTransportRealFuelRemainsController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


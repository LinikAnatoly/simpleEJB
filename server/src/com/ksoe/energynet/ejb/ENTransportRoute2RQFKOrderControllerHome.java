
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTransportRoute2RQFKOrder;  
  * 	
  */
  

public interface ENTransportRoute2RQFKOrderControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTransportRoute2RQFKOrderController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


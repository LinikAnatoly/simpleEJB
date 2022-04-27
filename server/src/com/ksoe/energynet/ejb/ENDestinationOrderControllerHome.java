
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENDestinationOrder;  
  * 	
  */
  

public interface ENDestinationOrderControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENDestinationOrderController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


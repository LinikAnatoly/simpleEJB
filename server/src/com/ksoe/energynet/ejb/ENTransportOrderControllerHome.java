
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTransportOrder;  
  * 	
  */
  

public interface ENTransportOrderControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTransportOrderController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


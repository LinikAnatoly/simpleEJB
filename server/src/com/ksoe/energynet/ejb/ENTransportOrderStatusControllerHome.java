
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTransportOrderStatus;  
  * 	
  */
  

public interface ENTransportOrderStatusControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTransportOrderStatusController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENDeliveryOrder;  
  * 	
  */
  

public interface ENDeliveryOrderControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENDeliveryOrderController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENWorkOrder;  
  * 	
  */
  

public interface ENWorkOrderControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENWorkOrderController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


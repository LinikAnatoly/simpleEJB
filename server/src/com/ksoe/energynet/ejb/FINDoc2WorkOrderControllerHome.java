
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for FINDoc2WorkOrder;  
  * 	
  */
  

public interface FINDoc2WorkOrderControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.FINDoc2WorkOrderController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


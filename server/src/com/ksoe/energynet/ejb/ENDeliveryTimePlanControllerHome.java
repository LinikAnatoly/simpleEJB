
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENDeliveryTimePlan;  
  * 	
  */
  

public interface ENDeliveryTimePlanControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENDeliveryTimePlanController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


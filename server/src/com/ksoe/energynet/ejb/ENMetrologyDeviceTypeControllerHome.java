
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENMetrologyDeviceType;  
  * 	
  */
  

public interface ENMetrologyDeviceTypeControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENMetrologyDeviceTypeController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


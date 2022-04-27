
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENMetrologyDevice;  
  * 	
  */
  

public interface ENMetrologyDeviceControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENMetrologyDeviceController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


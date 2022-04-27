
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for CNSubsystemType;  
  * 	
  */
  

public interface CNSubsystemTypeControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.CNSubsystemTypeController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


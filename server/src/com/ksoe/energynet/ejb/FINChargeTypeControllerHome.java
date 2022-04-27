
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for FINChargeType;  
  * 	
  */
  

public interface FINChargeTypeControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.FINChargeTypeController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


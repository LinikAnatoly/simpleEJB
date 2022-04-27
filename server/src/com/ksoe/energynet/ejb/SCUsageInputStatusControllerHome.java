
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for SCUsageInputStatus;  
  * 	
  */
  

public interface SCUsageInputStatusControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.SCUsageInputStatusController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


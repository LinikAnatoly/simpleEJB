
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENAct2CostRecovery;  
  * 	
  */
  

public interface ENAct2CostRecoveryControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENAct2CostRecoveryController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for FINChargeHistory;  
  * 	
  */
  

public interface FINChargeHistoryControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.FINChargeHistoryController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


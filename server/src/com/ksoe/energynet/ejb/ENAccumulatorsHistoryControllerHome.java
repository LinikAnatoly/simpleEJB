
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENAccumulatorsHistory;  
  * 	
  */
  

public interface ENAccumulatorsHistoryControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENAccumulatorsHistoryController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


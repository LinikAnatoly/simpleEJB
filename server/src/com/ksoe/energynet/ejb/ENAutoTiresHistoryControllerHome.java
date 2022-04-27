
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENAutoTiresHistory;  
  * 	
  */
  

public interface ENAutoTiresHistoryControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENAutoTiresHistoryController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


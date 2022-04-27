
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENSITFeatureHistory;  
  * 	
  */
  

public interface ENSITFeatureHistoryControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENSITFeatureHistoryController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


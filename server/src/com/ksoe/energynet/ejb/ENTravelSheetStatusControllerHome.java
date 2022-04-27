
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTravelSheetStatus;  
  * 	
  */
  

public interface ENTravelSheetStatusControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTravelSheetStatusController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


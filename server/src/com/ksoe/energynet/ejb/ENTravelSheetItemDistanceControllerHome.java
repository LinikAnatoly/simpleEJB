
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTravelSheetItemDistance;  
  * 	
  */
  

public interface ENTravelSheetItemDistanceControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTravelSheetItemDistanceController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


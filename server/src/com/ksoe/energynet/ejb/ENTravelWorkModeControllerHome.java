
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTravelWorkMode;  
  * 	
  */
  

public interface ENTravelWorkModeControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTravelWorkModeController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


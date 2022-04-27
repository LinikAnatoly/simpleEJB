
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTravelSheetType;  
  * 	
  */
  

public interface ENTravelSheetTypeControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTravelSheetTypeController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


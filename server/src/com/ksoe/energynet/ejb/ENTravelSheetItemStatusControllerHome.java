
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTravelSheetItemStatus;  
  * 	
  */
  

public interface ENTravelSheetItemStatusControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTravelSheetItemStatusController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


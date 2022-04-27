
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTravelSheetItem2TransportItem;  
  * 	
  */
  

public interface ENTravelSheetItem2TransportItemControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTravelSheetItem2TransportItemController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


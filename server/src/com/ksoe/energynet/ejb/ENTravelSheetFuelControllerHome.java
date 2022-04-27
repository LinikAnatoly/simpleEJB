
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTravelSheetFuel;  
  * 	
  */
  

public interface ENTravelSheetFuelControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTravelSheetFuelController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


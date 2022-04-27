
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTravelSheet;  
  * 	
  */
  

public interface ENTravelSheetControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTravelSheetController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


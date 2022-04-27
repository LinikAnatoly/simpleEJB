
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTransportOrder2Travel;  
  * 	
  */
  

public interface ENTransportOrder2TravelControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTransportOrder2TravelController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


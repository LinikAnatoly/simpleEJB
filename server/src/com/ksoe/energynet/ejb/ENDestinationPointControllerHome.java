
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENDestinationPoint;  
  * 	
  */
  

public interface ENDestinationPointControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENDestinationPointController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


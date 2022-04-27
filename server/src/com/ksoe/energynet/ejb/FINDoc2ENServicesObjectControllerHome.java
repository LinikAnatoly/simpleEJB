
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for FINDoc2ENServicesObject;  
  * 	
  */
  

public interface FINDoc2ENServicesObjectControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.FINDoc2ENServicesObjectController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


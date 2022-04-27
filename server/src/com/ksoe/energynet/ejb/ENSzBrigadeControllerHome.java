
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENSzBrigade;  
  * 	
  */
  

public interface ENSzBrigadeControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENSzBrigadeController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


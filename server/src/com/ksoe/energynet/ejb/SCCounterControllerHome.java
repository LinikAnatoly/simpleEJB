
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for SCCounter;  
  * 	
  */
  

public interface SCCounterControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.SCCounterController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


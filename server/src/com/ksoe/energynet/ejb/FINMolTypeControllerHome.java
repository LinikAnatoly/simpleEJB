
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for FINMolType;  
  * 	
  */
  

public interface FINMolTypeControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.FINMolTypeController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


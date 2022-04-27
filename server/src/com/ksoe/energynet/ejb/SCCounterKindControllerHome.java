
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for SCCounterKind;  
  * 	
  */
  

public interface SCCounterKindControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.SCCounterKindController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


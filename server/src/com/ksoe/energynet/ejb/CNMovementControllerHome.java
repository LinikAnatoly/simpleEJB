
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for CNMovement;  
  * 	
  */
  

public interface CNMovementControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.CNMovementController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


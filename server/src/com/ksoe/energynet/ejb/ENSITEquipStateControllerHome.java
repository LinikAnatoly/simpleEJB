
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENSITEquipState;  
  * 	
  */
  

public interface ENSITEquipStateControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENSITEquipStateController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


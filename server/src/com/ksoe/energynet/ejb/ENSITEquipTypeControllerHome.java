
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENSITEquipType;  
  * 	
  */
  

public interface ENSITEquipTypeControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENSITEquipTypeController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


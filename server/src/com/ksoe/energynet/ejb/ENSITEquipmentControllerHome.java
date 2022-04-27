
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENSITEquipment;  
  * 	
  */
  

public interface ENSITEquipmentControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENSITEquipmentController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


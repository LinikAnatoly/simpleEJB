
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENDistance;  
  * 	
  */
  

public interface ENDistanceControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENDistanceController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


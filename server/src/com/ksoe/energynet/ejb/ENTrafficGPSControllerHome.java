
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTrafficGPS;  
  * 	
  */
  

public interface ENTrafficGPSControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTrafficGPSController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


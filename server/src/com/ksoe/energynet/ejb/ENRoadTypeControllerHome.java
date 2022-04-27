
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENRoadType;  
  * 	
  */
  

public interface ENRoadTypeControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENRoadTypeController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


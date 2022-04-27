
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENSITFeatureType;  
  * 	
  */
  

public interface ENSITFeatureTypeControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENSITFeatureTypeController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


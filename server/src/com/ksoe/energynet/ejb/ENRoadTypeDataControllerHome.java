
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENRoadTypeData;  
  * 	
  */
  

public interface ENRoadTypeDataControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENRoadTypeDataController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


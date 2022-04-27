
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENRecordPointProm;  
  * 	
  */
  

public interface ENRecordPointPromControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENRecordPointPromController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


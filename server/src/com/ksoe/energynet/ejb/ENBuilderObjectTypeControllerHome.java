
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENBuilderObjectType;  
  * 	
  */
  

public interface ENBuilderObjectTypeControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENBuilderObjectTypeController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


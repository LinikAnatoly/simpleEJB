
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENConnectionPhasity;  
  * 	
  */
  

public interface ENConnectionPhasityControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENConnectionPhasityController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


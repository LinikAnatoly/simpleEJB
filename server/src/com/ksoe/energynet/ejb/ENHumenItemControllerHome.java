
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENHumenItem;  
  * 	
  */
  

public interface ENHumenItemControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENHumenItemController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


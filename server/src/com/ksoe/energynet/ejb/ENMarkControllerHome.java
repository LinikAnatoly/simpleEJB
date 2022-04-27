
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENMark;  
  * 	
  */
  

public interface ENMarkControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENMarkController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


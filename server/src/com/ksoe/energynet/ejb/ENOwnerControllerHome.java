
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
// Generated at Wed Sep 30 10:10:53 EEST 2009
// Created with ModelJ - the RAD tool for J2EE
// http://modelj.sourceforge.net
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENOwner;  
  * 	
  */
  

public interface ENOwnerControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENOwnerController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}



//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENManningTable;  
  * 	
  */
  

public interface ENManningTableControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENManningTableController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


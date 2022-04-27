
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENMetrologyCounter;  
  * 	
  */
  

public interface ENMetrologyCounterControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENMetrologyCounterController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


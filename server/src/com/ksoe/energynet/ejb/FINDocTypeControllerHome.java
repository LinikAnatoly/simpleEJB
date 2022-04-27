
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for FINDocType;  
  * 	
  */
  

public interface FINDocTypeControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.FINDocTypeController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


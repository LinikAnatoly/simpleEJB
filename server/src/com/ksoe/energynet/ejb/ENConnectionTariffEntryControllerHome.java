
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENConnectionTariffEntry;  
  * 	
  */
  

public interface ENConnectionTariffEntryControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENConnectionTariffEntryController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


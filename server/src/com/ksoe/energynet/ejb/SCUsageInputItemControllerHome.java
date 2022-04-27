
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for SCUsageInputItem;  
  * 	
  */
  

public interface SCUsageInputItemControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.SCUsageInputItemController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


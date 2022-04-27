
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for SCUsageInputItemOZ2SCCounter;  
  * 	
  */
  

public interface SCUsageInputItemOZ2SCCounterControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.SCUsageInputItemOZ2SCCounterController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


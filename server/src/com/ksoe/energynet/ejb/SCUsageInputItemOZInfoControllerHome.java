
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for SCUsageInputItemOZInfo;  
  * 	
  */
  

public interface SCUsageInputItemOZInfoControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.SCUsageInputItemOZInfoController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


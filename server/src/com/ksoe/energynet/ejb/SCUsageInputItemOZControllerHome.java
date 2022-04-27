
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for SCUsageInputItemOZ;  
  * 	
  */
  

public interface SCUsageInputItemOZControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.SCUsageInputItemOZController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


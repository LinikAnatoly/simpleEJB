
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for SCUsageInputItemKind;  
  * 	
  */
  

public interface SCUsageInputItemKindControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.SCUsageInputItemKindController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENEstimateItemKind;  
  * 	
  */
  

public interface ENEstimateItemKindControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENEstimateItemKindController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


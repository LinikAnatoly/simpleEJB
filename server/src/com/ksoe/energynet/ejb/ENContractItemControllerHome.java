
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENContractItem;  
  * 	
  */
  

public interface ENContractItemControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENContractItemController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


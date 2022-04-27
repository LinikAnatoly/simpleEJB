
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENContract;  
  * 	
  */
  

public interface ENContractControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENContractController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


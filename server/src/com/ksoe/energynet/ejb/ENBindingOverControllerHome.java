
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENBindingOver;  
  * 	
  */
  

public interface ENBindingOverControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENBindingOverController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


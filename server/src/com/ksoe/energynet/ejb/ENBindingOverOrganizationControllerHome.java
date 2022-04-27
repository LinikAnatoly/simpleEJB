
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENBindingOverOrganization;  
  * 	
  */
  

public interface ENBindingOverOrganizationControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENBindingOverOrganizationController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


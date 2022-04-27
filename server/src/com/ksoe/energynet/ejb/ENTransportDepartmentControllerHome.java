
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTransportDepartment;  
  * 	
  */
  

public interface ENTransportDepartmentControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTransportDepartmentController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


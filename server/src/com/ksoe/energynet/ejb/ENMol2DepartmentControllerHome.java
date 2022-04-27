
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENMol2Department;  
  * 	
  */
  

public interface ENMol2DepartmentControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENMol2DepartmentController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for CNRen2ENDepartment;  
  * 	
  */
  

public interface CNRen2ENDepartmentControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.CNRen2ENDepartmentController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


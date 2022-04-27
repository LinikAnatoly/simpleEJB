
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENDepartment2EPRen;  
  * 	
  */
  

public interface ENDepartment2EPRenControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENDepartment2EPRenController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


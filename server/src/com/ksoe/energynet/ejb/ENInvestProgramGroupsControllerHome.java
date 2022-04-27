
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENInvestProgramGroups;  
  * 	
  */
  

public interface ENInvestProgramGroupsControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENInvestProgramGroupsController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENMOL2PlanWork;  
  * 	
  */
  

public interface ENMOL2PlanWorkControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENMOL2PlanWorkController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


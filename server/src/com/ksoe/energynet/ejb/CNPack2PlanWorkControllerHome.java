
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for CNPack2PlanWork;  
  * 	
  */
  

public interface CNPack2PlanWorkControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.CNPack2PlanWorkController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


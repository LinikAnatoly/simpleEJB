
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTechCond2PlanWork;  
  * 	
  */
  

public interface ENTechCond2PlanWorkControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTechCond2PlanWorkController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


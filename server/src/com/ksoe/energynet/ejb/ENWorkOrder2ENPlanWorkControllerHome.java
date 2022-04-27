
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENWorkOrder2ENPlanWork;  
  * 	
  */
  

public interface ENWorkOrder2ENPlanWorkControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENWorkOrder2ENPlanWorkController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


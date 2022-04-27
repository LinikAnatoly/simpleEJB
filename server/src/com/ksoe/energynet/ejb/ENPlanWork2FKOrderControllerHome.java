
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENPlanWork2FKOrder;  
  * 	
  */
  

public interface ENPlanWork2FKOrderControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENPlanWork2FKOrderController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


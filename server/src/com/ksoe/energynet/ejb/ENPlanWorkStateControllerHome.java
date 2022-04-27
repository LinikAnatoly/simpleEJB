
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENPlanWorkState;  
  * 	
  */
  

public interface ENPlanWorkStateControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENPlanWorkStateController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}



//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENAct2ENPlanWork;  
  * 	
  */
  

public interface ENAct2ENPlanWorkControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENAct2ENPlanWorkController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


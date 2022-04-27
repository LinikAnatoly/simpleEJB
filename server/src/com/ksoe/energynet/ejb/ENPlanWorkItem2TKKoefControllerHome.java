
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENPlanWorkItem2TKKoef;  
  * 	
  */
  

public interface ENPlanWorkItem2TKKoefControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENPlanWorkItem2TKKoefController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


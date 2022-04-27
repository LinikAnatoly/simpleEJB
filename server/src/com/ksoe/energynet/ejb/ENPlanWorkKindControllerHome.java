
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENPlanWorkKind;  
  * 	
  */
  

public interface ENPlanWorkKindControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENPlanWorkKindController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


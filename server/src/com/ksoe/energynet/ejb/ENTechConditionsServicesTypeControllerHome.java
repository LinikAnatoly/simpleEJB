
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTechConditionsServicesType;  
  * 	
  */
  

public interface ENTechConditionsServicesTypeControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTechConditionsServicesTypeController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTechConditionsServices;  
  * 	
  */
  

public interface ENTechConditionsServicesControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTechConditionsServicesController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


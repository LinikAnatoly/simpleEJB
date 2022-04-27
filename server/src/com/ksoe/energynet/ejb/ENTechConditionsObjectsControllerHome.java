
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTechConditionsObjects;  
  * 	
  */
  

public interface ENTechConditionsObjectsControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTechConditionsObjectsController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


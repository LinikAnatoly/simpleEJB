
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENPlanWorkSource;  
  * 	
  */
  

public interface ENPlanWorkSourceControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENPlanWorkSourceController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


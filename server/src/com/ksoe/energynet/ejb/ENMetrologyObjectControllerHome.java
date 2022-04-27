
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENMetrologyObject;  
  * 	
  */
  

public interface ENMetrologyObjectControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENMetrologyObjectController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


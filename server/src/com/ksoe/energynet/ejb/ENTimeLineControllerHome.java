
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTimeLine;  
  * 	
  */
  

public interface ENTimeLineControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTimeLineController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


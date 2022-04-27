
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENCfoData;  
  * 	
  */
  

public interface ENCfoDataControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENCfoDataController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


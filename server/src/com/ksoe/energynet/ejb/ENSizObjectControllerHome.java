
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENSizObject;  
  * 	
  */
  

public interface ENSizObjectControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENSizObjectController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENMolType;  
  * 	
  */
  

public interface ENMolTypeControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENMolTypeController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


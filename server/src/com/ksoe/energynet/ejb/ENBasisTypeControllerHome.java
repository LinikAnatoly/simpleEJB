
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENBasisType;  
  * 	
  */
  

public interface ENBasisTypeControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENBasisTypeController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


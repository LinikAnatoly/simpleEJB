
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENWarrant;  
  * 	
  */
  

public interface ENWarrantControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENWarrantController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


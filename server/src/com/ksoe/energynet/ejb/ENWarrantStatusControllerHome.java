
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENWarrantStatus;  
  * 	
  */
  

public interface ENWarrantStatusControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENWarrantStatusController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


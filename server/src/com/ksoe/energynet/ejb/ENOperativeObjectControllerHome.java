
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENOperativeObject;  
  * 	
  */
  

public interface ENOperativeObjectControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENOperativeObjectController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


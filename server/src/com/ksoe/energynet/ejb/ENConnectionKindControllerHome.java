
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENConnectionKind;  
  * 	
  */
  

public interface ENConnectionKindControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENConnectionKindController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


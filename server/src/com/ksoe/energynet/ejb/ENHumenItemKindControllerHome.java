
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENHumenItemKind;  
  * 	
  */
  

public interface ENHumenItemKindControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENHumenItemKindController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENReconstrModernOZ2ENact;  
  * 	
  */
  

public interface ENReconstrModernOZ2ENactControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENReconstrModernOZ2ENactController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


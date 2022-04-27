
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENReconstrModernOZStatus;  
  * 	
  */
  

public interface ENReconstrModernOZStatusControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENReconstrModernOZStatusController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


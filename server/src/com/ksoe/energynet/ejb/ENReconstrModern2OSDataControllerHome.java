
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENReconstrModern2OSData;  
  * 	
  */
  

public interface ENReconstrModern2OSDataControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENReconstrModern2OSDataController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


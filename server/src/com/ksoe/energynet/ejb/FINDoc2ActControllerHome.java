
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for FINDoc2Act;  
  * 	
  */
  

public interface FINDoc2ActControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.FINDoc2ActController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


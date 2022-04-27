
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENAct2Humen;  
  * 	
  */
  

public interface ENAct2HumenControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENAct2HumenController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


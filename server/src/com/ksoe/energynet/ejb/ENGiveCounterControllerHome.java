
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENGiveCounter;  
  * 	
  */
  

public interface ENGiveCounterControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENGiveCounterController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}



//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENManningTable2TKPosition;  
  * 	
  */
  

public interface ENManningTable2TKPositionControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENManningTable2TKPositionController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


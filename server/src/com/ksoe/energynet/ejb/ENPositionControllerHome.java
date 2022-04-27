
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENPosition;  
  * 	
  */
  

public interface ENPositionControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENPositionController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


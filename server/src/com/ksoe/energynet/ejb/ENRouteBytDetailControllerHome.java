
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENRouteBytDetail;  
  * 	
  */
  

public interface ENRouteBytDetailControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENRouteBytDetailController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


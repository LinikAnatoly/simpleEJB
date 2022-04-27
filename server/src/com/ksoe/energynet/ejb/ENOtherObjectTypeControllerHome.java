
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENOtherObjectType;  
  * 	
  */
  

public interface ENOtherObjectTypeControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENOtherObjectTypeController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


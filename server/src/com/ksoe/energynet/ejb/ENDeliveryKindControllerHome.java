
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENDeliveryKind;  
  * 	
  */
  

public interface ENDeliveryKindControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENDeliveryKindController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


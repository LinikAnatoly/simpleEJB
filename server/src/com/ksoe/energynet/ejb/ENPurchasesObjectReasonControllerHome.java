
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENPurchasesObjectReason;  
  * 	
  */
  

public interface ENPurchasesObjectReasonControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENPurchasesObjectReasonController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


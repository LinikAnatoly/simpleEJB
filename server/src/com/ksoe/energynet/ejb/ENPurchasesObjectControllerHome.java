
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENPurchasesObject;  
  * 	
  */
  

public interface ENPurchasesObjectControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENPurchasesObjectController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


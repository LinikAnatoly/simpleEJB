
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENPurchasesNoObjectType;  
  * 	
  */
  

public interface ENPurchasesNoObjectTypeControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENPurchasesNoObjectTypeController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


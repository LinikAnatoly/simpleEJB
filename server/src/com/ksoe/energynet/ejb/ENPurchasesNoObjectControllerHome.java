
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENPurchasesNoObject;  
  * 	
  */
  

public interface ENPurchasesNoObjectControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENPurchasesNoObjectController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


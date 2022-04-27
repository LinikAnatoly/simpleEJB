
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENEstimateItem2ENEstimateItem;  
  * 	
  */
  

public interface ENEstimateItem2ENEstimateItemControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENEstimateItem2ENEstimateItemController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENEstimateItem2Type;  
  * 	
  */
  

public interface ENEstimateItem2TypeControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENEstimateItem2TypeController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


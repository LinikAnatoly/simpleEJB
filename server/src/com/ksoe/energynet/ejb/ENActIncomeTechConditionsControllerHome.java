
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENActIncomeTechConditions;  
  * 	
  */
  

public interface ENActIncomeTechConditionsControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENActIncomeTechConditionsController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENActIncomeStatus;  
  * 	
  */
  

public interface ENActIncomeStatusControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENActIncomeStatusController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


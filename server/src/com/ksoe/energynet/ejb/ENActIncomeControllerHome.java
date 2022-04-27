
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENActIncome;  
  * 	
  */
  

public interface ENActIncomeControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENActIncomeController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


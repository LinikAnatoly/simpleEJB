
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENActIncome2ENAct;  
  * 	
  */
  

public interface ENActIncome2ENActControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENActIncome2ENActController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


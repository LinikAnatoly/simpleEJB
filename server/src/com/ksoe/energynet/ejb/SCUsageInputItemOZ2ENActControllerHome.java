
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for SCUsageInputItemOZ2ENAct;  
  * 	
  */
  

public interface SCUsageInputItemOZ2ENActControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.SCUsageInputItemOZ2ENActController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENNomenclaturesOperative;  
  * 	
  */
  

public interface ENNomenclaturesOperativeControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENNomenclaturesOperativeController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


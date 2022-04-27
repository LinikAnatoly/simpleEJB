
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENConnectionTariff;  
  * 	
  */
  

public interface ENConnectionTariffControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENConnectionTariffController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


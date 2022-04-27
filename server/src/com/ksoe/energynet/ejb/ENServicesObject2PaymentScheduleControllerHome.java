
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENServicesObject2PaymentSchedule;  
  * 	
  */
  

public interface ENServicesObject2PaymentScheduleControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENServicesObject2PaymentScheduleController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


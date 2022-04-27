
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENAccumulatorsDistance;  
  * 	
  */
  

public interface ENAccumulatorsDistanceControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENAccumulatorsDistanceController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


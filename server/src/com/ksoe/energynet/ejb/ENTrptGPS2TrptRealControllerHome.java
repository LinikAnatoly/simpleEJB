
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright � 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTrptGPS2TrptReal;  
  * 	
  */
  

public interface ENTrptGPS2TrptRealControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTrptGPS2TrptRealController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


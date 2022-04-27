
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENTransport2ENEstimate;  
  * 	
  */
  

public interface ENTransport2ENEstimateControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENTransport2ENEstimateController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


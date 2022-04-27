
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for FINMol;  
  * 	
  */
  

public interface FINMolControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.FINMolController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


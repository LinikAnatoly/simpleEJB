
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for FINDoc2MolData;  
  * 	
  */
  

public interface FINDoc2MolDataControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.FINDoc2MolDataController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


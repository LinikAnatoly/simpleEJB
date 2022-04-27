
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2009 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for FINMaterials;  
  * 	
  */
  

public interface FINMaterialsControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.FINMaterialsController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


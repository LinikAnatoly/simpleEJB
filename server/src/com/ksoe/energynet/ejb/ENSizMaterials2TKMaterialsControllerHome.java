
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;


  /**
  * EJB Home interface for ENSizMaterials2TKMaterials;  
  * 	
  */
  

public interface ENSizMaterials2TKMaterialsControllerHome extends javax.ejb.EJBHome
{
  public com.ksoe.energynet.ejb.ENSizMaterials2TKMaterialsController create() 
    throws java.rmi.RemoteException, javax.ejb.CreateException;
}


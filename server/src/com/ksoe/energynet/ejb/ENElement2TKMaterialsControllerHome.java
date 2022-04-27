
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENElement2TKMaterials;
 *
 */

public interface ENElement2TKMaterialsControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENElement2TKMaterialsController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}
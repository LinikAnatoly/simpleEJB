
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENIPItem2TKMaterials;
 *
 */

public interface ENIPItem2TKMaterialsControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENIPItem2TKMaterialsController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}

//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENServicesMaterials;
 *
 */

public interface ENServicesMaterialsControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENServicesMaterialsController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}
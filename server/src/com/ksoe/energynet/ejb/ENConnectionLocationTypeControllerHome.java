
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENConnectionLocationType;
 *
 */

public interface ENConnectionLocationTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENConnectionLocationTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}

//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENConnectionLineType;
 *
 */

public interface ENConnectionLineTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENConnectionLineTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}
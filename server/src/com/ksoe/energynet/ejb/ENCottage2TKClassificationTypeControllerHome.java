
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENCottage2TKClassificationType;
 *
 */

public interface ENCottage2TKClassificationTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENCottage2TKClassificationTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}
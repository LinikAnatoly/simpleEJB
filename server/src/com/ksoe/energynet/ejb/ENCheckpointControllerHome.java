
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENCheckpoint;
 *
 */

public interface ENCheckpointControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENCheckpointController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}
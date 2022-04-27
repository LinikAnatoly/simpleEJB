
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENCheckpointPassListItem;
 *
 */

public interface ENCheckpointPassListItemControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENCheckpointPassListItemController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}
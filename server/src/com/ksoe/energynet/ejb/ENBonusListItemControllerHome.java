
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENBonusListItem;
 *
 */

public interface ENBonusListItemControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENBonusListItemController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}
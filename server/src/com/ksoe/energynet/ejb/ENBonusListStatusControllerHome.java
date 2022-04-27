
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENBonusListStatus;
 *
 */

public interface ENBonusListStatusControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENBonusListStatusController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}
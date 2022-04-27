
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENBonusList;
 *
 */

public interface ENBonusListControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENBonusListController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}
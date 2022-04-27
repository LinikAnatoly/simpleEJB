
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENCalcAdditionalItemType;
 *
 */

public interface ENCalcAdditionalItemTypeControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENCalcAdditionalItemTypeController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}
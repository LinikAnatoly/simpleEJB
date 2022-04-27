
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENCalcPowerReserveItem;
 *
 */

public interface ENCalcPowerReserveItemControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENCalcPowerReserveItemController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}
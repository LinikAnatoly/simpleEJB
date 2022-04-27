
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENCalcPowerReserve;
 *
 */

public interface ENCalcPowerReserveControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENCalcPowerReserveController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}

//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENCalc2ConnectTariff;
 *
 */

public interface ENCalc2ConnectTariffControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENCalc2ConnectTariffController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}
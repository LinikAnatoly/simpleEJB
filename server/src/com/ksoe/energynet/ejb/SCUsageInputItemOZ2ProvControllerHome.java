
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2017 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for SCUsageInputItemOZ2Prov;
 *
 */

public interface SCUsageInputItemOZ2ProvControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.SCUsageInputItemOZ2ProvController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}
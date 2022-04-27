
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENAgreementKind;
 *
 */

public interface ENAgreementKindControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENAgreementKindController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}
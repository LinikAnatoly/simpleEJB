
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2019 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENAdditionalAgreement;
 *
 */

public interface ENAdditionalAgreementControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENAdditionalAgreementController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}
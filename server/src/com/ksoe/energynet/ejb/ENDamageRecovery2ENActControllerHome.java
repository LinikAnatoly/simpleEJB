
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENDamageRecovery2ENAct;
 *
 */

public interface ENDamageRecovery2ENActControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENDamageRecovery2ENActController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}
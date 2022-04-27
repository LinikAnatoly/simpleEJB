
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENTransportDep2User;
 *
 */

public interface ENTransportDep2UserControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENTransportDep2UserController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}

//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENSORItems2Post04;
 *
 */

public interface ENSORItems2Post04ControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENSORItems2Post04Controller create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}
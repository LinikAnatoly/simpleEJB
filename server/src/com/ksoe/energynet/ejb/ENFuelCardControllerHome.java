
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2022 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENFuelCard;
 *
 */

public interface ENFuelCardControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENFuelCardController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}
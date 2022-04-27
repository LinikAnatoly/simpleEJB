
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENTechAgr2SOKind;
 *
 */

public interface ENTechAgr2SOKindControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENTechAgr2SOKindController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}

//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2016 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENPWI2Element;
 *
 */

public interface ENPWI2ElementControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENPWI2ElementController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}
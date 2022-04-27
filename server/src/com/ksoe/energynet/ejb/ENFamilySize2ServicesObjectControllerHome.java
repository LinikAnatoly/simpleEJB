
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENFamilySize2ServicesObject;
 *
 */

public interface ENFamilySize2ServicesObjectControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENFamilySize2ServicesObjectController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}
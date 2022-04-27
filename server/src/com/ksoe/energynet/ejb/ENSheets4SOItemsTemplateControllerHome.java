
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENSheets4SOItemsTemplate;
 *
 */

public interface ENSheets4SOItemsTemplateControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENSheets4SOItemsTemplateController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}
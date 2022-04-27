
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENDocAttachment2TKTechCard;
 *
 */

public interface ENDocAttachment2TKTechCardControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENDocAttachment2TKTechCardController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}
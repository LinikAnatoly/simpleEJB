
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright � 2020 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENActPostingSpecCharacters;
 *
 */

public interface ENActPostingSpecCharactersControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENActPostingSpecCharactersController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}

//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------


package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENEstimate2ENEstimateDiv;
 *
 */

public interface ENEstimate2ENEstimateDivControllerHome extends javax.ejb.EJBHome {
	public com.ksoe.energynet.ejb.ENEstimate2ENEstimateDivController create()
			throws java.rmi.RemoteException, javax.ejb.CreateException;
}
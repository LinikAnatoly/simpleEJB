//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.ejb;

/**
 * EJB Home interface for ENUnitedGroup2TechCondServices;
 *
 */

public interface ENUnitedGroup2TechCondServicesControllerHome extends
        javax.ejb.EJBHome {
    public com.ksoe.energynet.ejb.ENUnitedGroup2TechCondServicesController create()
            throws java.rmi.RemoteException, javax.ejb.CreateException;
}
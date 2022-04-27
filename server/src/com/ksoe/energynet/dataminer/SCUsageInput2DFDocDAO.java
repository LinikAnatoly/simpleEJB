
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.util.Date;

import com.ksoe.energynet.dataminer.generated.SCUsageInput2DFDocDAOGen;
import com.ksoe.energynet.valueobject.SCUsageInput2DFDoc;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for SCUsageInput2DFDoc;
 *
 */

public class SCUsageInput2DFDocDAO extends SCUsageInput2DFDocDAOGen {

    public SCUsageInput2DFDocDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public SCUsageInput2DFDocDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    @Override
	public int add(SCUsageInput2DFDoc anObject) throws PersistenceException
    {
        anObject.userAdd = getUserProfile().userName;
        anObject.dateAdd = new Date();
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        return super.add(anObject);
    }

    @Override
	public void save(SCUsageInput2DFDoc anObject) throws PersistenceException
    {
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        super.save(anObject);
    }

} // end of SCUsageInput2DFDocDAO

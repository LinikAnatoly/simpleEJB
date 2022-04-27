
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2021 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.util.Date;

import com.ksoe.energynet.dataminer.generated.ENActIncomeTech2DFDocDAOGen;
import com.ksoe.energynet.valueobject.ENActIncomeTech2DFDoc;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENActIncomeTech2DFDoc;
 *
 */

public class ENActIncomeTech2DFDocDAO extends ENActIncomeTech2DFDocDAOGen {

    public ENActIncomeTech2DFDocDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENActIncomeTech2DFDocDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    @Override
	public int add(ENActIncomeTech2DFDoc anObject) throws PersistenceException
    {
        anObject.userAdd = getUserProfile().userName;
        anObject.dateAdd = new Date();
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        return super.add(anObject);
    }

    @Override
	public void save(ENActIncomeTech2DFDoc anObject) throws PersistenceException
    {
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        super.save(anObject);
    }

} // end of ENActIncomeTech2DFDocDAO


//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.util.Date;

import com.ksoe.energynet.dataminer.generated.ENActFailureDAOGen;
import com.ksoe.energynet.valueobject.ENActFailure;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENActFailure;
 *
 */

public class ENActFailureDAO extends ENActFailureDAOGen {

    public ENActFailureDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENActFailureDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    public int add(ENActFailure anObject) throws PersistenceException
    {
        anObject.userAdd = getUserProfile().userName;
        anObject.dateAdd = new Date();
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        return super.add(anObject);
    }

    public void save(ENActFailure anObject) throws PersistenceException
    {
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        super.save(anObject);
    }    
} // end of ENActFailureDAO

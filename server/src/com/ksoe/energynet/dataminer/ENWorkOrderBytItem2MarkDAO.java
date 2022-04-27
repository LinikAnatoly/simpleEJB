
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2015 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.util.Date;

import com.ksoe.energynet.dataminer.generated.ENWorkOrderBytItem2MarkDAOGen;
import com.ksoe.energynet.valueobject.ENWorkOrderBytItem2Mark;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENWorkOrderBytItem2Mark;
 *
 */

public class ENWorkOrderBytItem2MarkDAO extends ENWorkOrderBytItem2MarkDAOGen {

    public ENWorkOrderBytItem2MarkDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENWorkOrderBytItem2MarkDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    public int add(ENWorkOrderBytItem2Mark anObject) throws PersistenceException
    {
        anObject.userAdd = getUserProfile().userName;
        anObject.dateAdd = new Date();
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        return super.add(anObject);
    }

    public void save(ENWorkOrderBytItem2Mark anObject) throws PersistenceException
    {
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        super.save(anObject);
    }    
} // end of ENWorkOrderBytItem2MarkDAO

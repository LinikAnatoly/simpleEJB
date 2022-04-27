
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.util.Date;

import com.ksoe.energynet.dataminer.generated.ENIPItem2ENIPItemDAOGen;
import com.ksoe.energynet.valueobject.ENIPItem2ENIPItem;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENIPItem2ENIPItem;
 *
 */

public class ENIPItem2ENIPItemDAO extends ENIPItem2ENIPItemDAOGen {

    public ENIPItem2ENIPItemDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENIPItem2ENIPItemDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    public int add(ENIPItem2ENIPItem anObject) throws PersistenceException
    {
        anObject.userAdd = getUserProfile().userName;
        anObject.dateAdd = new Date();
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        return super.add(anObject);
    }

    public void save(ENIPItem2ENIPItem anObject) throws PersistenceException
    {
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        super.save(anObject);
    }    

} // end of ENIPItem2ENIPItemDAO

//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.ksoe.energynet.dataminer.generated.ENUnitedGroupConnectionsDAOGen;
import com.ksoe.lla.persistence.SequenceKey;
import com.ksoe.lla.persistence.SequenceValue;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENUnitedGroupConnections;
 *
 */

public class ENUnitedGroupConnectionsDAO extends ENUnitedGroupConnectionsDAOGen {

    public ENUnitedGroupConnectionsDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENUnitedGroupConnectionsDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


    public int _collectAutoIncrementFields()
            throws PersistenceException {

        SequenceKey hashKey = new SequenceKey("ENUNITEDGROUPCONNECTNS", "CODE");
        Integer nextSeqValue = null;
        SequenceValue sequenceValue;
        synchronized (_sequenceTable) { sequenceValue = (SequenceValue) _sequenceTable.get(hashKey);
            if (sequenceValue == null) {
                sequenceValue = getNewSequenceValue("ENUNITEDGROUPCONNECTNS", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
            if (!sequenceValue.isNextValueAvailable()) {
                sequenceValue = getNewSequenceValue("ENUNITEDGROUPCONNECTNS", "CODE");
                _sequenceTable.put(hashKey, sequenceValue);
            }
        }

        nextSeqValue = sequenceValue.getNextValue();
        if (nextSeqValue == null) {
            throw new PersistenceException(
                    "Can't obtain auto increment value from: ENUNITEDGROUPCONNECTNS");
        } else {

            return nextSeqValue.intValue();
        }
    }



} // end of ENUnitedGroupConnectionsDAO


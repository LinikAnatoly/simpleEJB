
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2014 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.util.Date;

import com.ksoe.energynet.dataminer.generated.ENTravelSheetFuel2FINMaterialsDAOGen;
import com.ksoe.energynet.valueobject.ENTravelSheetFuel2FINMaterials;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENTravelSheetFuel2FINMaterials;
 *
 */

public class ENTravelSheetFuel2FINMaterialsDAO extends ENTravelSheetFuel2FINMaterialsDAOGen {

    public ENTravelSheetFuel2FINMaterialsDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENTravelSheetFuel2FINMaterialsDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }

    public int add(ENTravelSheetFuel2FINMaterials anObject) throws PersistenceException
    {
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        return super.add(anObject);
    }

    public void save(ENTravelSheetFuel2FINMaterials anObject) throws PersistenceException
    {
        anObject.userGen = getUserProfile().userName;
        anObject.dateEdit = new Date();

        super.save(anObject);
    }    
} // end of ENTravelSheetFuel2FINMaterialsDAO

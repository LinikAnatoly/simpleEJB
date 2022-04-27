
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2018 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.util.Date;

import com.ksoe.energynet.dataminer.generated.ENActIncomServ2ProvDAOGen;
import com.ksoe.energynet.valueobject.ENActIncomServ2Prov;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

/**
 * DAO Object for ENActIncomServ2Prov;
 *
 */

public class ENActIncomServ2ProvDAO extends ENActIncomServ2ProvDAOGen {

    public ENActIncomServ2ProvDAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENActIncomServ2ProvDAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }


	@Override
	public int add(ENActIncomServ2Prov actIncomServ2Prov) throws PersistenceException {

		actIncomServ2Prov.userGen = getUserProfile().userName;
		actIncomServ2Prov.dateEdit = new Date();

		return add(actIncomServ2Prov, true);
	}

} // end of ENActIncomServ2ProvDAO

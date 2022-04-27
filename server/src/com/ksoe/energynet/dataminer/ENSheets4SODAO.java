
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2019 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENSheets4SODAOGen;
import com.ksoe.energynet.valueobject.ENServicesObject;
import com.ksoe.energynet.valueobject.filter.ENSheets4SOFilter;
import com.ksoe.energynet.valueobject.lists.ENSheets4SOShortList;

/**
 * DAO Object for ENSheets4SO;
 *
 */

public class ENSheets4SODAO extends ENSheets4SODAOGen {

    public ENSheets4SODAO(UserProfile anUserProfile,
            Connection aConnection) {
        super(anUserProfile, aConnection);
    }

    public ENSheets4SODAO(Connection aConnection,
            UserProfile anUserProfile) {
        super(aConnection, anUserProfile);
    }
    
    public ENSheets4SOShortList getListByENServicesObject(ENServicesObject servicesObject) throws PersistenceException {
    	ENSheets4SOFilter filter = new ENSheets4SOFilter();
    	filter.servicesobject.code = servicesObject.code;
    	filter.orderBySQL = String.format("%s asc", ENSheets4SOFilter.dateGen_QFielld);
    	return this.getFilteredList(filter);
    }


} // end of ENSheets4SODAO


//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENMetrologyDeviceDAOGen;
import com.ksoe.energynet.valueobject.ENMetrologyDevice;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENMetrologyDevice;
  *
  */

public class ENMetrologyDeviceDAO extends ENMetrologyDeviceDAOGen {

    public void remove(int uid) throws PersistenceException
    {
        ENMetrologyDevice obj = getObject(uid);

        super.remove(uid);

        ENElementDAO eDao = new ENElementDAO(super.getConnection(), super.getUserProfile() );
        eDao.remove(obj.element.code);
    }


  public ENMetrologyDeviceDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENMetrologyDeviceDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

} // end of ENMetrologyDeviceDAO


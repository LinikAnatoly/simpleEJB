
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENMetrologyObjectDAOGen;
import com.ksoe.energynet.valueobject.ENMetrologyObject;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENMetrologyObject;
  *
  */

public class ENMetrologyObjectDAO extends ENMetrologyObjectDAOGen {


  public ENMetrologyObjectDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENMetrologyObjectDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public void remove(int uid) throws PersistenceException
  {
    ENMetrologyObject obj = getObject(uid);

    super.remove(uid);

    ENElementDAO eDao = new ENElementDAO(super.getConnection(), super.getUserProfile() );
    eDao.remove(obj.element.code);
  }


} // end of ENMetrologyObjectDAO


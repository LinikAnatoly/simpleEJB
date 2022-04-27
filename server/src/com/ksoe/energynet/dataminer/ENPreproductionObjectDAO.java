
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENPreproductionObjectDAOGen;
import com.ksoe.energynet.valueobject.ENPreproductionObject;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENPreproductionObject;
  *
  */

public class ENPreproductionObjectDAO extends ENPreproductionObjectDAOGen {


  public ENPreproductionObjectDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENPreproductionObjectDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

  public void remove(int uid) throws PersistenceException
  {
    ENPreproductionObject obj = getObject(uid);

    super.remove(uid);

    ENElementDAO eDao = new ENElementDAO(super.getConnection(), super.getUserProfile() );
    eDao.remove(obj.element.code);
  }


} // end of ENPreproductionObjectDAO


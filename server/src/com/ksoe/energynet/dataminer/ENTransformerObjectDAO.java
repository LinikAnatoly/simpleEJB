
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENTransformerObjectDAOGen;
import com.ksoe.energynet.valueobject.ENTransformerObject;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENTransformerObject;
  *
  */

public class ENTransformerObjectDAO extends ENTransformerObjectDAOGen {


  public ENTransformerObjectDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTransformerObjectDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

  public void remove(int uid) throws PersistenceException
  {
    ENTransformerObject obj = getObject(uid);
     super.remove(uid);

     ENElementDAO eDao = new ENElementDAO(super.getConnection(), super.getUserProfile() );
     eDao.remove(obj.element.code);
  }


} // end of ENTransformerObjectDAO



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.util.Date;

import com.ksoe.energynet.dataminer.generated.ENOtherObjectDAOGen;
import com.ksoe.energynet.valueobject.ENOtherObject;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENOtherObject;
  *
  */

public class ENOtherObjectDAO extends ENOtherObjectDAOGen {


  public ENOtherObjectDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENOtherObjectDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public void remove(int uid) throws PersistenceException
  {
    ENOtherObject obj = getObject(uid);

    super.remove(uid);

    ENElementDAO eDao = new ENElementDAO(super.getConnection(), super.getUserProfile() );
    eDao.remove(obj.element.code);
  }

  public int add(ENOtherObject obj) throws PersistenceException
  {
    obj.userGen = getUserProfile().userName;
    obj.dateEdit = new Date();
    return super.add(obj);
  }

  public void save(ENOtherObject obj) throws PersistenceException
  {
    obj.userGen = getUserProfile().userName;
    obj.dateEdit = new Date();
    super.save(obj);
  }

} // end of ENOtherObjectDAO


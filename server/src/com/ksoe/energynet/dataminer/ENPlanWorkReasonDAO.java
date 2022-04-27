
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.util.Date;

import com.ksoe.energynet.dataminer.generated.ENPlanWorkReasonDAOGen;
import com.ksoe.energynet.valueobject.ENPlanWorkReason;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENPlanWorkReason;
  *
  */

public class ENPlanWorkReasonDAO extends ENPlanWorkReasonDAOGen {


  public ENPlanWorkReasonDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENPlanWorkReasonDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}



  public int add(ENPlanWorkReason anObject) throws PersistenceException
  {
    anObject.dateEdit = new Date();
    anObject.userGen = getUserProfile().userName;
    return super.add(anObject);
  }

  public void save(ENPlanWorkReason anObject) throws PersistenceException
  {
    anObject.dateEdit = new Date();
    anObject.userGen = getUserProfile().userName;
    super.save(anObject,null);
  }


} // end of ENPlanWorkReasonDAO


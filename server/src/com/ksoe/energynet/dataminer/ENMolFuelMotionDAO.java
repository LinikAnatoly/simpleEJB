
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.util.Date;

import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENMolFuelMotionDAOGen;
import com.ksoe.energynet.valueobject.ENMolFuelMotion;

  /**
  *  DAO Object for ENMolFuelMotion;  
  * 	
  */

public class ENMolFuelMotionDAO extends ENMolFuelMotionDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENMolFuelMotionDAO() {super();}
  //public ENMolFuelMotionDAO(Connection aConnection) {super(aConnection);}
  //public ENMolFuelMotionDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENMolFuelMotionDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENMolFuelMotionDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public int add(ENMolFuelMotion anObject) throws PersistenceException
  {
	anObject.dateEdit = new Date();
	anObject.userGen = getUserProfile().userName;
    return super.add(anObject);
  }

} // end of ENMolFuelMotionDAO


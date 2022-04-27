
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENSITEquipmentDAOGen;
import com.ksoe.energynet.valueobject.ENSITEquipment;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENSITEquipment;  
  * 	
  */

public class ENSITEquipmentDAO extends ENSITEquipmentDAOGen {

  public ENSITEquipmentDAO() {super();}
  public ENSITEquipmentDAO(Connection aConnection) {super(aConnection);}
  public ENSITEquipmentDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENSITEquipmentDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENSITEquipmentDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public void remove(int uid) throws PersistenceException
  {
	  ENSITEquipment obj = getObject(uid);
	  
	  super.remove(uid);
	  
	  ENElementDAO eDao = new ENElementDAO(super.getConnection(), super.getUserProfile() );
	  eDao.remove(obj.element.code);
	  
  }


} // end of ENSITEquipmentDAO


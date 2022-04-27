
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.util.Date;

import com.ksoe.energynet.dataminer.generated.ENServicesObject2ProvDAOGen;
import com.ksoe.energynet.valueobject.ENServicesObject2Prov;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENServicesObject2Prov;  
  * 	
  */

public class ENServicesObject2ProvDAO extends ENServicesObject2ProvDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENServicesObject2ProvDAO() {super();}
  //public ENServicesObject2ProvDAO(Connection aConnection) {super(aConnection);}
  //public ENServicesObject2ProvDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENServicesObject2ProvDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENServicesObject2ProvDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}

  public int add(ENServicesObject2Prov anObject) throws PersistenceException
  {
	  anObject.dateEdit = new Date();
	  anObject.userGen = getUserProfile().userName;
	  return super.add(anObject);   
  }

  public void save(ENServicesObject2Prov anObject) throws PersistenceException
  {
	  anObject.dateEdit = new Date();
	  anObject.userGen = getUserProfile().userName;
	  super.save(anObject);
  }

} // end of ENServicesObject2ProvDAO


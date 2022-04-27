
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENServicesFactCalcByActDAOGen;
import com.ksoe.energynet.valueobject.ENServicesFactCalcByAct;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENServicesFactCalcByAct;  
  * 	
  */

public class ENServicesFactCalcByActDAO extends ENServicesFactCalcByActDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENServicesFactCalcByActDAO() {super();}
  //public ENServicesFactCalcByActDAO(Connection aConnection) {super(aConnection);}
  //public ENServicesFactCalcByActDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENServicesFactCalcByActDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENServicesFactCalcByActDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public int add(ENServicesFactCalcByAct obj) throws PersistenceException
  {
	  
	  obj.dateEdit = new java.util.Date();
	  obj.userGen = getUserProfile().userName;

	  return super.add(obj);
  }


  public void save(ENServicesFactCalcByAct obj) throws PersistenceException
  {
	  obj.dateEdit = new java.util.Date();
	  obj.userGen = getUserProfile().userName;

	  super.save(obj);
  }

} // end of ENServicesFactCalcByActDAO


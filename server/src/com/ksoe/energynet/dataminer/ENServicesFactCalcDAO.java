
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENServicesFactCalcDAOGen;
import com.ksoe.energynet.valueobject.ENServicesFactCalc;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENServicesFactCalc;  
  * 	
  */

public class ENServicesFactCalcDAO extends ENServicesFactCalcDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENServicesFactCalcDAO() {super();}
  //public ENServicesFactCalcDAO(Connection aConnection) {super(aConnection);}
  //public ENServicesFactCalcDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENServicesFactCalcDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENServicesFactCalcDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public int add(ENServicesFactCalc obj) throws PersistenceException
  {
	  
	  obj.dateEdit = new java.util.Date();
	  obj.userGen = getUserProfile().userName;

	  return super.add(obj);
  }


  public void save(ENServicesFactCalc obj) throws PersistenceException
  {
	  obj.dateEdit = new java.util.Date();
	  obj.userGen = getUserProfile().userName;

	  super.save(obj);
  }  


} // end of ENServicesFactCalcDAO


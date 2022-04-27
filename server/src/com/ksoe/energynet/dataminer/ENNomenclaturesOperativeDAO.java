
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import java.util.Date;

import com.ksoe.energynet.dataminer.generated.ENNomenclaturesOperativeDAOGen;
import com.ksoe.energynet.valueobject.ENNomenclaturesOperative;
import com.ksoe.lla.persistence.exception.PersistenceException;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENNomenclaturesOperative;  
  * 	
  */

public class ENNomenclaturesOperativeDAO extends ENNomenclaturesOperativeDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENNomenclaturesOperativeDAO() {super();}
  //public ENNomenclaturesOperativeDAO(Connection aConnection) {super(aConnection);}
  //public ENNomenclaturesOperativeDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENNomenclaturesOperativeDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENNomenclaturesOperativeDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}


  public int add(ENNomenclaturesOperative anObject) throws PersistenceException
  {
	  anObject.dateEdit = new Date();
	  anObject.userGen = getUserProfile().userName;
	  return super.add(anObject);	  
  }
  
  public void save(ENNomenclaturesOperative anObject) throws PersistenceException
  {
	  anObject.dateEdit = new Date();
	  anObject.userGen = getUserProfile().userName;
	  super.save(anObject);
  }   


} // end of ENNomenclaturesOperativeDAO


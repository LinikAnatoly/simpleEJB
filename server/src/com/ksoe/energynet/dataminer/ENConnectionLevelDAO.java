
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENConnectionLevelDAOGen;

  /**
  *  DAO Object for ENConnectionLevel;  
  * 	
  */

public class ENConnectionLevelDAO extends ENConnectionLevelDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENConnectionLevelDAO() {super();}
  //public ENConnectionLevelDAO(Connection aConnection) {super(aConnection);}
  //public ENConnectionLevelDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENConnectionLevelDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENConnectionLevelDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENConnectionLevelDAO


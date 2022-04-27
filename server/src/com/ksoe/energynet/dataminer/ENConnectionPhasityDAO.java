
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENConnectionPhasityDAOGen;

  /**
  *  DAO Object for ENConnectionPhasity;  
  * 	
  */

public class ENConnectionPhasityDAO extends ENConnectionPhasityDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENConnectionPhasityDAO() {super();}
  //public ENConnectionPhasityDAO(Connection aConnection) {super(aConnection);}
  //public ENConnectionPhasityDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENConnectionPhasityDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENConnectionPhasityDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENConnectionPhasityDAO


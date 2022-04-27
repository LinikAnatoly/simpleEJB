
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENTrafficGPSDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENTrafficGPS;  
  * 	
  */

public class ENTrafficGPSDAO extends ENTrafficGPSDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTrafficGPSDAO() {super();}
  //public ENTrafficGPSDAO(Connection aConnection) {super(aConnection);}
  //public ENTrafficGPSDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTrafficGPSDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTrafficGPSDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENTrafficGPSDAO


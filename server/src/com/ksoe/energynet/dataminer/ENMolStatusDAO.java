
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENMolStatusDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENMolStatus;  
  * 	
  */

public class ENMolStatusDAO extends ENMolStatusDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENMolStatusDAO() {super();}
  //public ENMolStatusDAO(Connection aConnection) {super(aConnection);}
  //public ENMolStatusDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENMolStatusDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENMolStatusDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENMolStatusDAO


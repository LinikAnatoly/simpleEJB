
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENServicesObjectStatusDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENServicesObjectStatus;  
  * 	
  */

public class ENServicesObjectStatusDAO extends ENServicesObjectStatusDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENServicesObjectStatusDAO() {super();}
  //public ENServicesObjectStatusDAO(Connection aConnection) {super(aConnection);}
  //public ENServicesObjectStatusDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENServicesObjectStatusDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENServicesObjectStatusDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENServicesObjectStatusDAO


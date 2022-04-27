
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENTransportDep2DepDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENTransportDep2Dep;  
  * 	
  */

public class ENTransportDep2DepDAO extends ENTransportDep2DepDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTransportDep2DepDAO() {super();}
  //public ENTransportDep2DepDAO(Connection aConnection) {super(aConnection);}
  //public ENTransportDep2DepDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTransportDep2DepDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTransportDep2DepDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENTransportDep2DepDAO


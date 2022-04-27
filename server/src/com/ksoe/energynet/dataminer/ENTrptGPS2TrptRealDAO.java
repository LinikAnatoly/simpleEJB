
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENTrptGPS2TrptRealDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENTrptGPS2TrptReal;  
  * 	
  */

public class ENTrptGPS2TrptRealDAO extends ENTrptGPS2TrptRealDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTrptGPS2TrptRealDAO() {super();}
  //public ENTrptGPS2TrptRealDAO(Connection aConnection) {super(aConnection);}
  //public ENTrptGPS2TrptRealDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTrptGPS2TrptRealDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTrptGPS2TrptRealDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENTrptGPS2TrptRealDAO


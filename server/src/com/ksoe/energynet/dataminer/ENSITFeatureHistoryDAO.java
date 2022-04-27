

//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENSITFeatureHistoryDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENSITFeatureHistory;  
  * 	
  */

public class ENSITFeatureHistoryDAO extends ENSITFeatureHistoryDAOGen {

  public ENSITFeatureHistoryDAO() {super();}
  public ENSITFeatureHistoryDAO(Connection aConnection) {super(aConnection);}
  public ENSITFeatureHistoryDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENSITFeatureHistoryDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENSITFeatureHistoryDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENSITFeatureHistoryDAO


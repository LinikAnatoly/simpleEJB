
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENSITFeatureTypeDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENSITFeatureType;  
  * 	
  */

public class ENSITFeatureTypeDAO extends ENSITFeatureTypeDAOGen {

  public ENSITFeatureTypeDAO() {super();}
  public ENSITFeatureTypeDAO(Connection aConnection) {super(aConnection);}
  public ENSITFeatureTypeDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENSITFeatureTypeDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENSITFeatureTypeDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENSITFeatureTypeDAO


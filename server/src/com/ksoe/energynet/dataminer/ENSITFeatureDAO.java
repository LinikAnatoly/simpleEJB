
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENSITFeatureDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENSITFeature;  
  * 	
  */

public class ENSITFeatureDAO extends ENSITFeatureDAOGen {

  public ENSITFeatureDAO() {super();}
  public ENSITFeatureDAO(Connection aConnection) {super(aConnection);}
  public ENSITFeatureDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENSITFeatureDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENSITFeatureDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENSITFeatureDAO


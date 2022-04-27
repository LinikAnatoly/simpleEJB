
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.CNSubsystemTypeDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for CNSubsystemType;  
  * 	
  */

public class CNSubsystemTypeDAO extends CNSubsystemTypeDAOGen {

  public CNSubsystemTypeDAO() {super();}
  public CNSubsystemTypeDAO(Connection aConnection) {super(aConnection);}
  public CNSubsystemTypeDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public CNSubsystemTypeDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public CNSubsystemTypeDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of CNSubsystemTypeDAO


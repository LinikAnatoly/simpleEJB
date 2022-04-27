

//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENSITEquipTypeDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENSITEquipType;  
  * 	
  */

public class ENSITEquipTypeDAO extends ENSITEquipTypeDAOGen {

  public ENSITEquipTypeDAO() {super();}
  public ENSITEquipTypeDAO(Connection aConnection) {super(aConnection);}
  public ENSITEquipTypeDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENSITEquipTypeDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENSITEquipTypeDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENSITEquipTypeDAO



//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENSITEquipStateDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENSITEquipState;  
  * 	
  */

public class ENSITEquipStateDAO extends ENSITEquipStateDAOGen {

  public ENSITEquipStateDAO() {super();}
  public ENSITEquipStateDAO(Connection aConnection) {super(aConnection);}
  public ENSITEquipStateDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENSITEquipStateDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENSITEquipStateDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENSITEquipStateDAO


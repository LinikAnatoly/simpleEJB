
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENTravelSheetFuelRemainsDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENTravelSheetFuelRemains;  
  * 	
  */

public class ENTravelSheetFuelRemainsDAO extends ENTravelSheetFuelRemainsDAOGen {

  //public ENTravelSheetFuelRemainsDAO() {super();}
 // public ENTravelSheetFuelRemainsDAO(Connection aConnection) {super(aConnection);}
  //public ENTravelSheetFuelRemainsDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTravelSheetFuelRemainsDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTravelSheetFuelRemainsDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENTravelSheetFuelRemainsDAO


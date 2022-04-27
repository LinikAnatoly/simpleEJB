
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENTravelSheetItemDistance2TKFuelKoefDAOGen;

  /**
  *  DAO Object for ENTravelSheetItemDistance2TKFuelKoef;  
  * 	
  */

public class ENTravelSheetItemDistance2TKFuelKoefDAO extends ENTravelSheetItemDistance2TKFuelKoefDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTravelSheetItemDistance2TKFuelKoefDAO() {super();}
  //public ENTravelSheetItemDistance2TKFuelKoefDAO(Connection aConnection) {super(aConnection);}
  //public ENTravelSheetItemDistance2TKFuelKoefDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTravelSheetItemDistance2TKFuelKoefDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTravelSheetItemDistance2TKFuelKoefDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENTravelSheetItemDistance2TKFuelKoefDAO


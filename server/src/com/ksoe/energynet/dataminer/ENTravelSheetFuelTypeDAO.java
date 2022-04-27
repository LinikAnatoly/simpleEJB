
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENTravelSheetFuelTypeDAOGen;

  /**
  *  DAO Object for ENTravelSheetFuelType;  
  * 	
  */

public class ENTravelSheetFuelTypeDAO extends ENTravelSheetFuelTypeDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENTravelSheetFuelTypeDAO() {super();}
  //public ENTravelSheetFuelTypeDAO(Connection aConnection) {super(aConnection);}
  //public ENTravelSheetFuelTypeDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENTravelSheetFuelTypeDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENTravelSheetFuelTypeDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENTravelSheetFuelTypeDAO



//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.FINChargeTypeDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for FINChargeType;  
  * 	
  */

public class FINChargeTypeDAO extends FINChargeTypeDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public FINChargeTypeDAO() {super();}
  //public FINChargeTypeDAO(Connection aConnection) {super(aConnection);}
  //public FINChargeTypeDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public FINChargeTypeDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public FINChargeTypeDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of FINChargeTypeDAO


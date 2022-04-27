
//---------------------------------------------------------
// Application: EnergyNet
// Author     : Kherson
//
// Copyright © 2010 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.CNPack2PlanWorkDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for CNPack2PlanWork;  
  * 	
  */

public class CNPack2PlanWorkDAO extends CNPack2PlanWorkDAOGen {

  public CNPack2PlanWorkDAO() {super();}
  public CNPack2PlanWorkDAO(Connection aConnection) {super(aConnection);}
  public CNPack2PlanWorkDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public CNPack2PlanWorkDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public CNPack2PlanWorkDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of CNPack2PlanWorkDAO


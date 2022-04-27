
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENInvestProgramGroupsDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENInvestProgramGroups;  
  * 	
  */

public class ENInvestProgramGroupsDAO extends ENInvestProgramGroupsDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENInvestProgramGroupsDAO() {super();}
  //public ENInvestProgramGroupsDAO(Connection aConnection) {super(aConnection);}
  //public ENInvestProgramGroupsDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENInvestProgramGroupsDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENInvestProgramGroupsDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENInvestProgramGroupsDAO


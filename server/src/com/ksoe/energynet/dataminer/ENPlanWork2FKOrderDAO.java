
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENPlanWork2FKOrderDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENPlanWork2FKOrder;  
  * 	
  */

public class ENPlanWork2FKOrderDAO extends ENPlanWork2FKOrderDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENPlanWork2FKOrderDAO() {super();}
  //public ENPlanWork2FKOrderDAO(Connection aConnection) {super(aConnection);}
  //public ENPlanWork2FKOrderDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENPlanWork2FKOrderDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENPlanWork2FKOrderDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENPlanWork2FKOrderDAO


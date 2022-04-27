
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2011 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;

import com.ksoe.energynet.dataminer.generated.ENActIncomeStatusDAOGen;
import com.ksoe.lla.security.UserProfile;

  /**
  *  DAO Object for ENActIncomeStatus;  
  * 	
  */

public class ENActIncomeStatusDAO extends ENActIncomeStatusDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENActIncomeStatusDAO() {super();}
  //public ENActIncomeStatusDAO(Connection aConnection) {super(aConnection);}
  //public ENActIncomeStatusDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENActIncomeStatusDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENActIncomeStatusDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENActIncomeStatusDAO


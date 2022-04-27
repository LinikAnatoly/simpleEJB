
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.RecordPointWFDAOGen;

  /**
  *  DAO Object for RecordPointWF;  
  * 	
  */

public class RecordPointWFDAO extends RecordPointWFDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public RecordPointWFDAO() {super();}
  //public RecordPointWFDAO(Connection aConnection) {super(aConnection);}
  //public RecordPointWFDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public RecordPointWFDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public RecordPointWFDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of RecordPointWFDAO


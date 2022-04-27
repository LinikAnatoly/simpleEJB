
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2013 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENConnectionKindDAOGen;

  /**
  *  DAO Object for ENConnectionKind;  
  * 	
  */

public class ENConnectionKindDAO extends ENConnectionKindDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENConnectionKindDAO() {super();}
  //public ENConnectionKindDAO(Connection aConnection) {super(aConnection);}
  //public ENConnectionKindDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENConnectionKindDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENConnectionKindDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENConnectionKindDAO


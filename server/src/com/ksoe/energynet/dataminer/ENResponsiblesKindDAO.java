
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENResponsiblesKindDAOGen;

  /**
  *  DAO Object for ENResponsiblesKind;  
  * 	
  */

public class ENResponsiblesKindDAO extends ENResponsiblesKindDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENResponsiblesKindDAO() {super();}
  //public ENResponsiblesKindDAO(Connection aConnection) {super(aConnection);}
  //public ENResponsiblesKindDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENResponsiblesKindDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENResponsiblesKindDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENResponsiblesKindDAO


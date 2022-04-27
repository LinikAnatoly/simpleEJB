
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENReconstrModernOZStatusDAOGen;

  /**
  *  DAO Object for ENReconstrModernOZStatus;  
  * 	
  */

public class ENReconstrModernOZStatusDAO extends ENReconstrModernOZStatusDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENReconstrModernOZStatusDAO() {super();}
  //public ENReconstrModernOZStatusDAO(Connection aConnection) {super(aConnection);}
  //public ENReconstrModernOZStatusDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENReconstrModernOZStatusDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENReconstrModernOZStatusDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENReconstrModernOZStatusDAO


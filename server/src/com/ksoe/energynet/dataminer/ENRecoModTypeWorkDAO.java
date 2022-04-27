
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENRecoModTypeWorkDAOGen;

  /**
  *  DAO Object for ENRecoModTypeWork;  
  * 	
  */

public class ENRecoModTypeWorkDAO extends ENRecoModTypeWorkDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENRecoModTypeWorkDAO() {super();}
  //public ENRecoModTypeWorkDAO(Connection aConnection) {super(aConnection);}
  //public ENRecoModTypeWorkDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENRecoModTypeWorkDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENRecoModTypeWorkDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENRecoModTypeWorkDAO


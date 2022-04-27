
//---------------------------------------------------------
// Application: EnergyNET2
// Author     : Kherson
//
// Copyright © 2012 SIT
//---------------------------------------------------------

package com.ksoe.energynet.dataminer;

import java.sql.Connection;
import com.ksoe.lla.security.UserProfile;
import com.ksoe.energynet.dataminer.generated.ENDestinationOrderDAOGen;

  /**
  *  DAO Object for ENDestinationOrder;  
  * 	
  */

public class ENDestinationOrderDAO extends ENDestinationOrderDAOGen {

  // нах они такие .. потом вылетают ошибки !!!
  //public ENDestinationOrderDAO() {super();}
  //public ENDestinationOrderDAO(Connection aConnection) {super(aConnection);}
  //public ENDestinationOrderDAO(UserProfile anUserProfile) {super(anUserProfile);}
  public ENDestinationOrderDAO(UserProfile anUserProfile,Connection aConnection) {super(anUserProfile,aConnection);}
  public ENDestinationOrderDAO(Connection aConnection,UserProfile anUserProfile) {super(aConnection,anUserProfile);}




} // end of ENDestinationOrderDAO

